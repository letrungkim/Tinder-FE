//
//  InputPhoneNumbers.swift
//  Tinder-FE
//
//  Created by Gia Huy on 05/09/2022.
//

import SwiftUI

struct InputPhoneNumbers: View {
    
    enum FocusField: Hashable {
        case field
    }
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var signUpVMGroup = SignUpViewModelGroup()
    @FocusState private var focusedField: FocusField?
    @State private var disableButton: Bool = true
    @State private var showingListPhoneCodeONtation: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 80)
                //MARK: - TITLE
                Text("Số điện thoại của tôi là")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .lineLimit(0)
                Spacer().frame(height: 20)
                HStack {
                //MARK: - BUTTON CHOOSE INTERNATIONAL PHONE CODE FROM LIST
                    Button {
                        self.showingListPhoneCodeONtation = true
                    } label: {
                        Text("VN  +84")
                            .frame(width: 110)
                            .foregroundColor(.black)
                            .underlineTextField()
                            .font(.title)
                            
                    }
                    TextField("", text: $signUpVMGroup.number)
                        .focused($focusedField, equals: .field)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.focusedField = .field
                            }
                        }
                        .font(.title)
                        .foregroundColor(.black)
                        .underlineTextField()
                        .keyboardType(.phonePad)
                }
                .padding(.horizontal, 5)
                Spacer().frame(height: 30)
                //MARK: - MORE INFORMATION
                Text(signUpVMGroup.getAttributedString("Chúng tôi sẽ gửi tin nhắn cùng mã xác minh. Bạn có thể phải trả phí tin nhắn và dữ liệu. Tìm hiểu chuyện gì xảy ra khi số điện thoại của bạn thay đổi."))
                    .font(.system(size: 17, weight: .medium, design: .default))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 10)
                Spacer()
                //MARK: - BUTTON SUBMIT
                NavigationLink(destination: {
                    mdViewBetweenIpPhoneCodeAndWelcometoTinder()
                }, label: {
                    if signUpVMGroup.number.isEmpty {
                        Text("TIẾP TỤC")
                            .modifier(ButtonNextDisable())
                    } else {
                        Text("TIẾP TỤC")
                            .modifier(ButtonNextEnable())
                    }
                })
                .disabled(disableButton)
                .padding(.horizontal, 30)
                .onReceive(signUpVMGroup.$number, perform: { _ in
                    if !signUpVMGroup.number.isEmpty {
                        self.disableButton = false
                    } else if signUpVMGroup.number.isEmpty {
                        self.disableButton = true
                    }
                })
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .overlay(
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                  Image("darkGrayBackButton")
                        .resizable()
                        .scaledToFit()
                }
                .modifier(BackButtonModifier()),
                alignment: .topLeading
            )
            .padding(20)
            .sheet(isPresented: $showingListPhoneCodeONtation) {
                ListOfNumberCodeArea()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}



struct ListOfNumberCodeArea: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var lstNumVM = SignUpViewModelGroup()
    let alreadySortList = codeNumbers.sorted(by: {$0.name.prefix(3) < $1.name.prefix(3)})
    var body: some View {
        ZStack {
            VStack{
                Spacer().frame(height: 20)
                HStack {
                    Spacer()
                    Text("Chọn Mã Quốc Gia")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(Color.black)
                    Spacer()
                }
                .offset(y: -18)
                TextField("Search", text: $lstNumVM.Searchtext)
                    .textFieldStyle(
                        SearchTextField(systemImageName: "magnifyingglass")
                    )
                    .padding(.horizontal, 5)
                    .keyboardType(.default)
                List(alreadySortList) { element in
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        ListRowView(codeNumber: element)
                    }
                }
                .listStyle(.plain)
                Spacer()
            }
            .overlay(
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                  Image("darkGrayBackButton")
                        .resizable()
                        .scaledToFit()
                }
                    .modifier(BackButtonModifier()),alignment: .topLeading
            )
            .padding(20)
        }
    }
}

struct ListRowView: View {
    var codeNumber: NumberCodeAreaInfo
    var body: some View {
        HStack {
            Text("\(codeNumber.name)")
            Spacer()
            Text("+ \(codeNumber.nationCodeNumber)")
        }
        .font(.system(size: 25, weight: .medium, design: .default))
        .foregroundColor(Color("darkGrey"))
    }
}

struct InputPhoneNumbers_Previews: PreviewProvider {
    static var previews: some View {
        InputPhoneNumbers()
        ListOfNumberCodeArea()
    }
}
