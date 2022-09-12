//
//  AddImageView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 08/09/2022.
//

import SwiftUI
import NavigationStack

struct AddImageView: View {
    @StateObject var signUpVMGroup = SignUpViewModelGroup()
    @State private var disableButton: Bool = true
    @State private var goToNextView: Bool = false
    @State private var goBack: Bool = false
    var body: some View {
        ZStack {
            PopView(isActive: $goBack, label: {Text("")})
            PushView(destination: MainView(), isActive: $goToNextView, label: {Text("")})
            VStack {
                Spacer().frame(height: 50)
                Text("Thêm ảnh")
                    .font(.system(size: 45, weight: .medium, design: .default))
                    .padding(.leading, -10)
                Text("Thêm ít nhất 2 ảnh để tiếp tục.")
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                    .padding(.bottom, 50)
                
                Group {
                    HStack {
                        ZStack {
                            Image(signUpVMGroup.imageArray[0])
                                .resizable()
                                .modifier(ImageModifier())
                                .overlay(
                                    Button(action: {
                                        addOrDeleteImage(0, imageName: "gin")
                                    }) {
                                        if !signUpVMGroup.imageArray[0].contains("localimage") {
                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                        .mask(Image(systemName: "multiply.circle")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                            )
                                        } else {
                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                        .mask(Image(systemName: "plus.circle.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                            )
                                        }
                                    }
                                    .modifier(AddImageButtonModifier()),
                                    alignment: .bottomTrailing
                                )
                        }
                        .frame(width: 100, height: 160)
                        Spacer().frame(width: 30)
                        ZStack {
                            Image(signUpVMGroup.imageArray[1])
                                .resizable()
                                .modifier(ImageModifier())
                                .overlay(
                                    Button(action: {
                                        addOrDeleteImage(1, imageName: "rum")
                                    }) {
                                        if !signUpVMGroup.imageArray[1].contains("localimage") {
                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                        .mask(Image(systemName: "multiply.circle")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                            )
                                        } else {
                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                        .mask(Image(systemName: "plus.circle.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                            )
                                        }
                                    }
                                    .modifier(AddImageButtonModifier()),
                                    alignment: .bottomTrailing
                                )
                        }
                        .frame(width: 100, height: 160)
                        Spacer().frame(width: 30)
                        ZStack {
                            Image(signUpVMGroup.imageArray[2])
                                .resizable()
                                .modifier(ImageModifier())
                                .overlay(
                                    Button(action: {
                                        addOrDeleteImage(2, imageName: "vodka")
                                    }) {
                                        if !signUpVMGroup.imageArray[2].contains("localimage") {
                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                        .mask(Image(systemName: "multiply.circle")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                            )
                                        } else {
                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                        .mask(Image(systemName: "plus.circle.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                            )
                                        }
                                    }
                                    .modifier(AddImageButtonModifier()),
                                    alignment: .bottomTrailing
                                )
                        }
                        .frame(width: 100, height: 160)
                    }
                    Spacer().frame(height: 40)
                    HStack {
                        ZStack {
                            Image(signUpVMGroup.imageArray[3])
                                .resizable()
                                .modifier(ImageModifier())
                                .overlay(
                                    Button(action: {
                                        addOrDeleteImage(3, imageName: "vodka")
                                    }) {
                                        if !signUpVMGroup.imageArray[3].contains("localimage") {
                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                        .mask(Image(systemName: "multiply.circle")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                            )
                                        } else {
                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                        .mask(Image(systemName: "plus.circle.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                            )
                                        }
                                    }
                                    .modifier(AddImageButtonModifier()),
                                    alignment: .bottomTrailing
                                )
                        }
                        .frame(width: 100, height: 160)
                        Spacer().frame(width: 30)
                        ZStack {
                            Image(signUpVMGroup.imageArray[4])
                                .resizable()
                                .modifier(ImageModifier())
                                .overlay(
                                    Button(action: {
                                        addOrDeleteImage(4, imageName: "gin")
                                    }) {
                                        if !signUpVMGroup.imageArray[4].contains("localimage") {
                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                        .mask(Image(systemName: "multiply.circle")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                            )
                                        } else {
                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                        .mask(Image(systemName: "plus.circle.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                            )
                                        }
                                    }
                                    .modifier(AddImageButtonModifier()),
                                    alignment: .bottomTrailing
                                )
                        }
                        .frame(width: 100, height: 160)
                        Spacer().frame(width: 30)
                        ZStack {
                            Image(signUpVMGroup.imageArray[5])
                                .resizable()
                                .modifier(ImageModifier())
                                .overlay(
                                    Button(action: {
                                        addOrDeleteImage(5, imageName: "gin")
                                    }) {
                                        if !signUpVMGroup.imageArray[5].contains("localimage") {
                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                        .mask(Image(systemName: "multiply.circle")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                            )
                                        } else {
                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                        .mask(Image(systemName: "plus.circle.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                            )
                                        }
                                    }
                                    .modifier(AddImageButtonModifier()),
                                    alignment: .bottomTrailing
                                )
                        }
                        .frame(width: 100, height: 160)
                    }
                }
                Spacer()
                Button {
                    
                } label: {
                    if signUpVMGroup.countAddedImage >= 2 {
                        Text("TIẾP TỤC")
                            .modifier(ButtonNextEnable())
                    } else {
                        Text("TIẾP TỤC")
                            .modifier(ButtonNextDisable())
                    }
                    
                }
                .disabled(disableButton)
                .padding(.horizontal, 30)
                .onReceive(signUpVMGroup.$countAddedImage, perform: { _ in
                    if signUpVMGroup.countAddedImage >= 2 {
                        self.disableButton = false
                    } else {
                        self.disableButton = true
                    }
                })
                Spacer().frame(height: 40)
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
        }
    }
    
    
    func addOrDeleteImage(_ position: Int, imageName: String) {
        if signUpVMGroup.imageArray[position].contains("localimage") {
            signUpVMGroup.imageArray[position] = imageName
            signUpVMGroup.countAddedImage += 1
        } else if !signUpVMGroup.imageArray[position].contains("localimage") {
            signUpVMGroup.imageArray[position] = "localimage"
            signUpVMGroup.countAddedImage -= 1
        }
    }
}

struct AddImageView_Previews: PreviewProvider {
    static var previews: some View {
        AddImageView()
    }
}
