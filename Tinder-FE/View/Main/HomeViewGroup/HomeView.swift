//
//  HomeView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 09/09/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    var body: some View {
        VStack {
            Image("TinderLabelColorful")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.top, 25)
            
            ZStack{
                
                ZStack {
                    if let users = homeVM.displayData {
                        
                        if users.isEmpty {
                            Text("Bạn đã hết lượt quẹt phải, vui lòng nạp lần đầu")
                                .font(.caption)
                                .foregroundColor(.gray)
                        } else {
                            //MARK: DISPLAY CARD HERE !!
                            ForEach(users.reversed()) { user in
                                CardView(card: user)
                                    .environmentObject(homeVM)
                            }
                        }
                    } else {
                        ProgressView()
                    }
                }
                
                HStack(spacing: 15) {
                    Button(action: {}) {
                        Image("resetButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                    }
                    Button(action: {
                        doSwipe()
                    }) {
                        Image("nopeButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 65, height: 65)
                    }
                    Button(action: {}) {
                        Image("supperLikeButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                    }
                    Button(action: {
                        doSwipe(rightSwipe: true)
                    }) {
                        Image("likeButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 65, height: 65)
                    }
                    Button(action: {}) {
                        Image("boostButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                    }
                }
                .padding(.top, 570)
                .disabled(homeVM.displayData?.isEmpty ?? false)
                .opacity(homeVM.displayData?.isEmpty ?? false ? 0.5 : 1)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(25)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    func doSwipe(rightSwipe: Bool = false) {
        
        guard let first = homeVM.displayData?.first else {
            return
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("ACTION"), object: nil, userInfo: [
            "id": first.id,
            "rightSwipe": rightSwipe
        ])
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
