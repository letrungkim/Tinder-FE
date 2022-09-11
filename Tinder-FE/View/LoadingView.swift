//
//  LoadingView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 05/09/2022.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("tinderLabel")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 150, idealWidth: 200, maxWidth: 200, alignment: .center)
                    .padding(.vertical, 70)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(3)
                Spacer()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
