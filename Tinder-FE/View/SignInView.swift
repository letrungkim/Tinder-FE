//
//  SignInView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 05/09/2022.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var signInVM = SignInViewModel()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                //MARK: - LOGO
                Image("tinderLabel")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 150, idealWidth: 200, maxWidth: 200, alignment: .center)
                    .padding(.vertical, 70)
                //MARK: - LABEL
                Text(signInVM.getAttributedString("Khi nhấn Tạo Tài Khoản hoặc Đăng Nhập, bạn đồng ý với Điều Khoản của chúng tôi. Tìm hiểu về cách chúng tôi xử lý dữ liệu của bạn trong Chính sách Quyền Riêng Tư và Chính sách Cookie của chúng tôi."))
                    .font(.system(size: 17, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                //MARK: - BUTTON ĐĂNG NHẬP VỚI GOOGLE
                Button {
                    
                } label: {
                    HStack {
                        Spacer()
                        Image("google")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .padding(.leading, 10)
                        Text("ĐĂNG NHẬP VỚI GOOGLE")
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .offset(x: -15)
                            .tint(.white)
                            .font(.system(size: 17, weight: .medium, design: .default))
                        Spacer()
                    }
                    .overlay(
                        Capsule(style: .circular)
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 3))
                    )
                }
                .padding(.horizontal, 3)
                Spacer().frame(height: 15)
                
                //MARK: - BUTTON ĐĂNG NHẬP VỚI FACEBOOK
                Button {
                    
                } label: {
                    HStack {
                        Spacer()
                        Image("facebook")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .padding(.leading, 10)
                        Text("ĐĂNG NHẬP VỚI FACEBOOK")
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .offset(x: -10)
                            .tint(.white)
                            .font(.system(size: 17, weight: .medium, design: .default))
                        Spacer()
                    }
                    .overlay(
                        Capsule(style: .circular)
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 3))
                    )
                }
                .padding(.horizontal, 3)
                Spacer().frame(height: 15)
                
                //MARK: - BUTTON ĐĂNG NHẬP VỚI SỐ ĐIỆN THOẠI
                Button {
                    
                } label: {
                    HStack {
                        Spacer()
                        Image(systemName: "message.fill")
                            .resizable()
                            .tint(.white)
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .padding(.leading, 10)
                        Text("ĐĂNG NHẬP VỚI SỐ ĐIỆN THOẠI")
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .offset(x: -10)
                            .tint(.white)
                            .font(.system(size: 17, weight: .medium, design: .default))
                        Spacer()
                    }
                    .overlay(
                        Capsule(style: .circular)
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 3))
                    )
                }
                .padding(.horizontal, 3)
                Spacer().frame(height: 50)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .overlay(
                //MARK: - BUTTON BACK
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                  Image("grayBackButton")
                        .resizable()
                        .scaledToFit()
                }
                .modifier(BackButtonModifier()),
                alignment: .topLeading
            )
            .padding(20)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
