//
//  InputSchoolName.swift
//  Tinder-FE
//
//  Created by Gia Huy on 07/09/2022.
//

import SwiftUI

struct InputSchoolName: View {
    enum FocusField: Hashable {
        case field
    }
    
    @StateObject var signUpVMGroup = SignUpViewModelGroup()
    @FocusState private var focusedField: FocusField?
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 80)
                HStack {
                    Text("Trường\n của tôi là")
                        .font(.system(size: 50, weight: .bold, design: .default))
                        .padding(.leading, 50)
                    Spacer()
                }
                TextField("Tên trường", text: $signUpVMGroup.schoolName)
                    .focused($focusedField, equals: .field)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.focusedField = .field
                        }
                    }
                    .frame(width: 300)
                    .font(.title)
                    .foregroundColor(.black)
                    .underlineTextField()
                    .keyboardType(.default)
                Text("Đây là cách nội dung sẽ hiển thị trên Tinder")
                    .frame(width: 300)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(Color("darkGrey"))
                    .padding(.horizontal, -20)
                    .offset(y: -20)
                Spacer()
                //MARK: - BUTTON SUBMIT
                Button {
                    
                } label: {
                    if signUpVMGroup.schoolName.isEmpty {
                        HStack {
                            Spacer()
                            Text("BỎ QUA")
                            Spacer()
                        }
                        .modifier(OutlineButtonEnable())
                    } else {
                        Text("TIẾP TỤC")
                            .modifier(ButtonNextEnable())
                    }
                    
                }
                .padding(.horizontal, 30)
                .onReceive(signUpVMGroup.$schoolName, perform: { _ in
                    if !signUpVMGroup.schoolName.isEmpty {
                        
                    } else {
                        
                    }
                })
                Spacer().frame(height: 25)
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
            .padding(.top, 20)
            .padding(.horizontal, 20)
        }
    }
}

struct InputSchoolName_Previews: PreviewProvider {
    static var previews: some View {
        InputSchoolName()
    }
}
