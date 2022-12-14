//
//  ProfileView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 09/09/2022.
//

import SwiftUI
struct ProfileView: View {
    @State private var showingSettingView = false
    @State private var showingEditProfileView = false
    @State private var showingSaveProfileView = false
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    @State private var adds = [
        "Đăng nhiều ảnh sexy để được match nhiều hơn",
        "Hẹn hò an toàn, tình dục tự nguyện",
        "Đang độc thân? Ăn bò nướng lá lost đi. Bạn sẽ vẫn độc thân nhưng mà nó ngon",
        "Chú mèo đi HERE và những người bạn",
        "Code còn lỏ quá, mấy tiền bối cho em xin lỗi"
    ]
    var body: some View {
        ZStack {
            Color("lightGrey").ignoresSafeArea()
            VStack {
                VStack {
                    Image("TinderLabelColorful")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding(.top, 25)
                        .zIndex(1.0)
                    Spacer().frame(height: 20)
                    Image("vodka")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .background(
                            Circle().fill(Color.white).scaleEffect(3)
                        )
                    HStack {
                        Text("Vodka, 26")
                            .font(.title2)
                            .fontWeight(.bold)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)
                    }
                    Spacer().frame(height: 30)
                    HStack {
                        Button {
                            showingSettingView = true
                        } label: {
                            Image(systemName: "gearshape.fill")
                                    .foregroundColor(Color("darkGrey"))
                                    .padding()
                                    .background(.white)
                                    .clipShape(Circle())
                                    .modifier(ShadowModifier())
                        }
                        Spacer()
                        Button {
                            showingSaveProfileView = true
                        } label: {
                            Image(systemName: "shield.fill")
                                    .foregroundColor(Color("darkGrey"))
                                    .padding()
                                    .background(.white)
                                    .clipShape(Circle())
                                    .modifier(ShadowModifier())
                        }
                    }
                    .padding(.horizontal, 80)
                    Button {
                        showingEditProfileView = true
                    } label: {
                        Image(systemName: "pencil")
                                .foregroundColor(Color("darkGrey"))
                                .font(.largeTitle)
                                .padding()
                                .background(.white)
                                .clipShape(Circle())
                                .modifier(ShadowModifier())
                    }
                    .offset(y: -20)
                }
                .frame(height: 458)
                .sheet(isPresented: $showingSettingView) {
                    SettingView()
                }
                .sheet(isPresented: $showingEditProfileView) {
                    ProfileViewMiddle()
                }
                .sheet(isPresented: $showingSaveProfileView) {
                    SaveAccountCenterView()
                }
                Spacer()
                TabView(selection: $currentIndex) {
                    ForEach(0..<adds.count, id: \.self) { index in
                        Text(adds[index])
                    }
                }
                .padding(.horizontal, 20)
                .frame(width: 400 ,height: 100)
                .tabViewStyle(PageTabViewStyle())
                .onReceive(timer) { _ in
                    withAnimation {
                        currentIndex = currentIndex < adds.count ? currentIndex + 1 : 0
                    }
                }
                Spacer()
            }
        }
    }
}


struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var signUpVMGroup = SignUpViewModelGroup()
    @State private var phonenumber = "02345678"
    @State private var email = "emailclone01@gmail.com"
    @State private var account = ""
    let phonenumbers = ["02345678", "01234568", "01234567"]
    let emails = ["emailclone01@gmail.com", "emailclone02@gmail.com", "emailclone03@gmail.com"]
    @State private var ischooseMale: Bool = true
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Cài đặt")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(Color.black)
                        .padding(.top, 15)
                    Spacer()
                }
                NavigationView {
                    Form {
                        Section(header: Text("CÀI ĐẶT TÀI KHOẢN").font(.system(size: 15, weight: .regular))) {
                            Picker("Số Điện Thoại", selection: $phonenumber) {
                                ForEach(phonenumbers, id: \.self) { number in
                                    Text(number)
                                        .foregroundColor(.gray)
                                }
                            }
                            Picker("Tài khoản đã kết nối", selection: $account) {
                                
                            }
                            Picker("Email", selection: $email) {
                                ForEach(emails, id: \.self) { number in
                                    Text(number)
                                        .foregroundColor(.pink)
                                }
                            }
                        }
                        Button {
                            
                        } label: {
                            HStack {
                                Spacer()
                                Text("Đăng xuất")
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                        Section {
                            
                        } header: {
                            HStack {
                                Spacer()
                                VStack {
                                    Image("tinderLogo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                        .padding(.bottom, 10)
                                    Text("Phiên bản 1.1.0").font(.system(size: 17, weight: .regular, design: .default))
                                }
                                Spacer()
                            }
                        }
                        Button {
                            
                        } label: {
                            HStack {
                                Spacer()
                                Text("Xoá Tài khoản")
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                        
                        
                    }
                    .padding(.horizontal, -25)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                }
                
            }
            .overlay(
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Xong")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(Color("lightRed"))
                        .padding(.top, 34)
                }
                    .modifier(ClosePresentViewButton()),alignment: .topTrailing
            )
        }
    }
}

struct ProfileViewMiddle: View {
    @State var isGoToEditProfile: Bool = true
    var body: some View {
        ZStack {
            if isGoToEditProfile {
                EditProfileView(active: $isGoToEditProfile)
            } else {
                ProfilePreviewView(active: $isGoToEditProfile)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
        SettingView()
        ProfileViewMiddle()
        SaveAccountCenterView()
    }
}
