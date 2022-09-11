//
//  SwiftExtensions.swift
//  Tinder-FE
//
//  Created by Gia Huy on 05/09/2022.
//

import Foundation
import SwiftUI

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 4).padding(.top, 40))
            .foregroundColor(.gray)
            .padding(10)
    }
}
