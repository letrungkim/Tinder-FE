//
//  InputPhoneVerifyCode.swift
//  Tinder-FE
//
//  Created by Gia Huy on 06/09/2022.
//

import SwiftUI
import Combine

struct InputPhoneVerifyCode: View {
    
    enum FocusField: Hashable {
        case field
    }
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var signUpVMGroup = SignUpViewModelGroup()
    @Binding var isActive: Bool
    @FocusState private var focusedField: FocusField?
    @State private var disableButton: Bool = true
    let textLimit = 6
    
    var body: some View {
        ZStack {
            TextField("", text: $signUpVMGroup.code)
                .focused($focusedField, equals: .field)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.focusedField = .field
                    }
                }
                .onReceive(Just(signUpVMGroup.code)) {_ in limitText(textLimit) }
                .keyboardType(.phonePad)
            Color.white.ignoresSafeArea()
            VStack {
                Spacer().frame(height: 80)
                HStack {
                    Text("Mã của tôi là")
                        .font(.system(size: 45, weight: .bold, design: .default))
                        .foregroundColor(Color.black)
                        .lineLimit(0)
                        .padding(.leading, 30)
                    Spacer()
                }
                Spacer().frame(height: 15)
                HStack {
                    Text("840123456789")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(Color("darkGrey"))
                        .lineLimit(0)
                        .padding(.leading, 30)
                    Button {
                        
                    } label: {
                        Text("Gửi Lại")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                Spacer().frame(height: 30)
                HStack(spacing: 5) {
                    ForEach(0..<6,id: \.self) { index in
                        VerifyCodeView(code: getCodeAtIndex(index: index))
                    }
                }
                .padding(.horizontal, 30)
                Spacer()
                //MARK: - BUTTON SUBMIT
                Button {
                    self.isActive = false
                } label: {
                    if signUpVMGroup.code.isEmpty || signUpVMGroup.code.count != 6 {
                        Text("TIẾP TỤC")
                            .modifier(ButtonNextDisable())
                    } else {
                        Text("TIẾP TỤC")
                            .modifier(ButtonNextEnable())
                    }
                    
                }
                .disabled(disableButton)
                .padding(.horizontal, 30)
                .onReceive(signUpVMGroup.$code, perform: { _ in
                    if !signUpVMGroup.code.isEmpty && signUpVMGroup.code.count == 6 {
                        self.disableButton = false
                    } else {
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
        }
    }
    
    
    func getCodeAtIndex(index: Int) -> String {
        if signUpVMGroup.code.count > index {
            let start = signUpVMGroup.code.startIndex
            let current = signUpVMGroup.code.index(start, offsetBy: index)
            
            return String(signUpVMGroup.code[current])
        }
        return ""
    }
    //Function to keep text length in limits
    func limitText(_ limit: Int) {
        if signUpVMGroup.code.count > limit {
            signUpVMGroup.code = String(signUpVMGroup.code.prefix(limit))
        }
    }
}

struct VerifyCodeView: View {
    var code: String
    
    var body: some View {
        VStack {
            Text(code)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .font(.title)
                .frame(height: 45)
            
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(height: 4)
            
            
        }
    }
}

struct mdViewBetweenIpPhoneCodeAndWelcometoTinder: View {
    @State var isActive: Bool = true
    @State private var animatingView = false
    var body: some View {
        ZStack {
            if isActive {
                InputPhoneVerifyCode(isActive: $isActive)
            } else {
                WelcomeToTinderView()
                    .opacity(animatingView ? 1 : 0)
                    .animation(Animation.easeInOut(duration: 1).repeatCount(1), value: animatingView)
                    .onAppear(perform: {
                        self.animatingView.toggle()
                    })
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct InputPhoneVerifyCode_Previews: PreviewProvider {
    static var previews: some View {
        InputPhoneVerifyCode(isActive: .constant(true))
    }
}
