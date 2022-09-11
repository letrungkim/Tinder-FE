//
//  MainView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 09/09/2022.
//

import SwiftUI


struct MainView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView()
                .tabItem {
                    if selectedTab == 0 {
                        Image("homeEnable")
                    } else {
                        Image("homeDisable")
                    }
                }
                .tag(0)
            
            DiscoverView()
                .tabItem {
                    if selectedTab == 1 {
                        Image("discoverEnable")
                    } else {
                        Image("discoverDisable")
                    }
                }
                .tag(1)
            
            SeeWhoLikesYouView()
                .tabItem {
                    if selectedTab == 2 {
                        Image("tinderGoldEnable")
                    } else {
                        Image("tinderGoldDisable")
                    }
                }
                .tag(2)
            
            ChatView()
                .tabItem {
                    if selectedTab == 3 {
                        Image("chatEnable")
                    } else {
                        Image("chatDisable")
                    }
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    if selectedTab == 4 {
                        Image("profileEnable")
                    } else {
                        Image("profileDisable")
                    }
                }
                .tag(4)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}




struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
