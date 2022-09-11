//
//  InputBirthDay.swift
//  Tinder-FE
//
//  Created by Gia Huy on 07/09/2022.
//

import SwiftUI
import Combine

struct InputBirthDay: View {
    
    enum FocusField: Hashable {
        case field
    }
    
    @StateObject var signUpVMGroup = SignUpViewModelGroup()
    @FocusState private var focusedField: FocusField?
    @State private var disableButton: Bool = true
    let textLimit = 8
    
    var body: some View {
        ZStack {
            TextField("", text: $signUpVMGroup.birthDay)
                .focused($focusedField, equals: .field)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.focusedField = .field
                    }
                }
                .onReceive(Just(signUpVMGroup.birthDay)) {_ in limitText(textLimit) }
                .keyboardType(.numberPad)
            Color.white.ignoresSafeArea()
            VStack {
                Spacer().frame(height: 80)
                HStack {
                    Text("Sinh nhật\ncủa tôi là")
                        .font(.system(size: 50, weight: .bold, design: .default))
                        .padding(.leading, 50)
                    Spacer()
                }
                Spacer().frame(height: 40)
                HStack(spacing: 10) {
                    ForEach(0..<8,id: \.self) { index in
                        FormatDateTextFieldView(birthday: getElementAtIndex(index: index))
                        if index == 1 || index == 3 {
                            Text("/")
                                .font(.title)
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                    }
                }
                .padding(.horizontal, 30)
                Text("Tuổi của bạn sẽ được hiển thị công khai")
                    .frame(width: 320)
                    .font(.system(size: 17, weight: .bold, design: .default))
                    .foregroundColor(Color("darkGrey"))
                Spacer()
                Button {
                    
                } label: {
                    if signUpVMGroup.birthDay.isEmpty || signUpVMGroup.birthDay.count != 8 {
                        Text("TIẾP TỤC")
                            .modifier(ButtonNextDisable())
                    } else {
                        Text("TIẾP TỤC")
                            .modifier(ButtonNextEnable())
                    }
                    
                }
                .disabled(disableButton)
                .padding(.horizontal, 30)
                .onReceive(signUpVMGroup.$birthDay, perform: { _ in
                    if !signUpVMGroup.birthDay.isEmpty && signUpVMGroup.birthDay.count == 8 {
                        self.disableButton = false
                    } else {
                        self.disableButton = true
                    }
                })
            }
            .overlay(
                Button(action: {
                    
                }) {
                  Image("darkGrayBackButton")
                        .resizable()
                        .scaledToFit()
                }
                .modifier(BackButtonModifier()),
                alignment: .topLeading
            )
            .padding(20)
        }
    }
    func getElementAtIndex(index: Int) -> String {
        if signUpVMGroup.birthDay.count > index {
            let start = signUpVMGroup.birthDay.startIndex
            let current = signUpVMGroup.birthDay.index(start, offsetBy: index)
            
            return String(signUpVMGroup.birthDay[current])
        }
        return ""
    }
    //Function to keep text length in limits
    func limitText(_ limit: Int) {
        if signUpVMGroup.birthDay.count > limit {
            signUpVMGroup.birthDay = String(signUpVMGroup.birthDay.prefix(limit))
        }
    }
}

struct FormatDateTextFieldView: View {
    var birthday: String
    
    var body: some View {
        VStack {
            Text(birthday)
                .foregroundColor(.black)
                .fontWeight(.light)
                .font(.title)
                .frame(height: 45)
            
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(height: 4)
            
            
        }
    }
}


struct InputBirthDay_Previews: PreviewProvider {
    static var previews: some View {
        InputBirthDay()
    }
}
