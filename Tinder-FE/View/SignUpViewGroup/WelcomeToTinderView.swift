//
//  WelcomeToTinderView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 08/09/2022.
//

import SwiftUI
import NavigationStack

struct WelcomeToTinderView: View {
    @State private var goToNextView: Bool = false
    var body: some View {
        NavigationStackView {
            ZStack {
                PushView(destination: InputNameView(), isActive: $goToNextView, label: {Text("")})
                VStack {
                    Spacer().frame(height: 70)
                    Group {
                        Image("tinderLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        Text("Chào mừng bạn đế với Tinder.")
                            .font(.system(size: 25, weight: .bold, design: .default))
                            .padding(.bottom, 5)
                        Text("Vui lòng tuân thủ các Quy Tắc Chung này.")
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .foregroundColor(.gray)
                        Spacer().frame(height: 50)
                        HStack {
                            Spacer().frame(width: 40)
                            Image(systemName: "checkmark")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(Color("lightPink"))
                            Text("Hãy là chính bạn.")
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.bottom, 2)
                        Text("Đảm bảo ảnh, độ tuổi và tiểu sử của bạn đều là thật.")
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 35)
                            .padding(.bottom, 25)
                        HStack {
                            Spacer().frame(width: 40)
                            Image(systemName: "checkmark")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(Color("lightPink"))
                            Text("Đảm bảo an toàn.")
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.bottom, 2)
                        Text("Đừng vội vàng chia sẻ thông tin cá nhân. Hẹn hò an toàn")
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 41)
                            .padding(.bottom, 25)
                    }
                    HStack {
                        Spacer().frame(width: 40)
                        Image(systemName: "checkmark")
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(Color("lightPink"))
                        Text("Cư xử chuẩn mực.")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.bottom, 2)
                    Text("Tôn trọng người khác và đối xử họ như cách bạn muốn mọi người thể hiện với bạn.")
                        .font(.system(size: 18, weight: .medium, design: .default))
                        .foregroundColor(.gray)
                        .padding(.horizontal, 32)
                        .padding(.bottom, 25)
                    HStack {
                        Spacer().frame(width: 40)
                        Image(systemName: "checkmark")
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(Color("lightPink"))
                        Text("Hãy chủ động.")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.bottom, 2)
                    Text("Luôn báo cáo hành vi xấu")
                        .font(.system(size: 18, weight: .medium, design: .default))
                        .foregroundColor(.gray)
                        .padding(.trailing, 100)
                    Spacer()
                    Button {
                        self.goToNextView = true
                    } label: {
                        Text("TIẾP TỤC")
                            .modifier(ButtonNextEnable())
                            .padding(.horizontal, 45)
                    }
                }
            }
        }
    }
}

struct WelcomeToTinderView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeToTinderView()
    }
}
