//
//  CustomTextField.swift
//  Tinder-FE
//
//  Created by Gia Huy on 06/09/2022.
//

import SwiftUI

struct SearchTextField: TextFieldStyle {
    
    let systemImageName: String
    
    // Hidden function to conform to this protocol
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("lightGrey"))
                .frame(height: 40)
            
            HStack {
                Image(systemName: systemImageName)
                // Reference the TextField here
                configuration
            }
            .padding(.leading)
            .foregroundColor(.black)
        }
    }
}
