//
//  DisplayGenderForMeView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 07/09/2022.
//

import SwiftUI
import NavigationStack

struct DisplayGenderForMeView: View {
    @State private var isChooseMale: Bool = false
    @State private var isChooseFeMale: Bool = true
    @State private var isChooseEveryOne: Bool = false
    @State private var goToNextView: Bool = false
    @State private var goBack: Bool = false
    var body: some View {
        ZStack {
            PopView(isActive: $goBack, label: {Text("")})
            PushView(destination: InputSchoolName(), isActive: $goToNextView, label: {Text("")})
            VStack {
                Spacer().frame(height: 90)
                HStack {
                    Spacer()
                    Text("Hiển thị cho tôi")
                        .font(.system(size: 45, weight: .bold, design: .default))
                    Spacer()
                }
                Spacer().frame(height: 100)
                //MARK: - BUTTON NỮ
                Button {
                    self.isChooseFeMale = true
                    self.isChooseMale = false
                    self.isChooseEveryOne = false
                } label: {
                    if isChooseFeMale == true {
                        HStack {
                            Spacer()
                            Text("NỮ")
                                .frame(maxWidth: .infinity, minHeight: 55)
                                .foregroundColor(Color("lightRed"))
                                .font(.system(size: 25, weight: .bold, design: .default))
                            Spacer()
                        }
                        .overlay(
                            Capsule(style: .circular)
                                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 3))
                        )
                    } else {
                        HStack {
                            Spacer()
                            Text("NỮ")
                                .frame(maxWidth: .infinity, minHeight: 55)
                                .foregroundColor(.gray)
                                .font(.system(size: 25, weight: .bold, design: .default))
                            Spacer()
                        }
                        .overlay(
                            Capsule(style: .circular)
                                .stroke(Color.gray, style: StrokeStyle(lineWidth: 3))
                        )
                    }
                    
                }
                .padding(.horizontal, 30)
                Spacer().frame(height: 15)
                //MARK: - BUTTON NAM
                Button {
                    self.isChooseFeMale = false
                    self.isChooseMale = true
                    self.isChooseEveryOne = false
                } label: {
                    if isChooseMale == true {
                        HStack {
                            Spacer()
                            Text("NAM")
                                .frame(maxWidth: .infinity, minHeight: 55)
                                .foregroundColor(Color("lightRed"))
                                .font(.system(size: 25, weight: .bold, design: .default))
                            Spacer()
                        }
                        .overlay(
                            Capsule(style: .circular)
                                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 3))
                        )
                    } else {
                        HStack {
                            Spacer()
                            Text("NAM")
                                .frame(maxWidth: .infinity, minHeight: 55)
                                .foregroundColor(.gray)
                                .font(.system(size: 25, weight: .bold, design: .default))
                            Spacer()
                        }
                        .overlay(
                            Capsule(style: .circular)
                                .stroke(Color.gray, style: StrokeStyle(lineWidth: 3))
                        )
                    }
                    
                }
                .padding(.horizontal, 30)
                Spacer().frame(height: 15)
                //MARK: - BUTTON NAM
                Button {
                    self.isChooseFeMale = false
                    self.isChooseMale = false
                    self.isChooseEveryOne = true
                } label: {
                    if isChooseEveryOne == true {
                        HStack {
                            Spacer()
                            Text("MỌI NGƯỜI")
                                .frame(maxWidth: .infinity, minHeight: 55)
                                .foregroundColor(Color("lightRed"))
                                .font(.system(size: 25, weight: .bold, design: .default))
                            Spacer()
                        }
                        .overlay(
                            Capsule(style: .circular)
                                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 3))
                        )
                    } else {
                        HStack {
                            Spacer()
                            Text("MỌI NGƯỜI")
                                .frame(maxWidth: .infinity, minHeight: 55)
                                .foregroundColor(.gray)
                                .font(.system(size: 25, weight: .bold, design: .default))
                            Spacer()
                        }
                        .overlay(
                            Capsule(style: .circular)
                                .stroke(Color.gray, style: StrokeStyle(lineWidth: 3))
                        )
                    }
                    
                }
                .padding(.horizontal, 30)
                Spacer()
                //MARK: - BUTTON TIẾP TỤC
                Button {
                    self.goToNextView = true
                } label: {
                    Text("TIẾP TỤC")
                        .frame(maxWidth: .infinity, minHeight: 55)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing))
                        .tint(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .modifier(ShadowModifier())
                }
                .padding(.horizontal, 30)
                .offset(y: -70)
            }
            .overlay(
                Button(action: {
                    self.goBack = true
                }) {
                  Image("darkGrayBackButton")
                        .resizable()
                        .scaledToFit()
                }
                .modifier(BackButtonModifier()),
                alignment: .topLeading
            )
            .padding(20)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct DisplayGenderForMeView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayGenderForMeView()
    }
}
