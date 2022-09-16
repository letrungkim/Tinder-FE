//
//  ContentView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 05/09/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RootView()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
