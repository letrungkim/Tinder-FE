//
//  SignUpViewModelGroup.swift
//  Tinder-FE
//
//  Created by Gia Huy on 05/09/2022.
//

import SwiftUI

class SignUpViewModelGroup: ObservableObject {
    @Published var number = ""
    @Published var Searchtext: String = ""
    @Published var code = ""
    @Published var name = ""
    @Published var birthDay = ""
    @Published var gender = ""
    @Published var schoolName = ""
    @Published var favouriteArray: [String] = []
    @Published var imageArray: [String] = ["localimage","localimage","localimage","localimage","localimage","localimage"]
    @Published var countAddedImage = 0
    
    //Return Attributed String and Hyperlink
    func getAttributedString(_ string: String) -> AttributedString {
        var attributedString = AttributedString(string)
        //Apllying bold and underline to hyperlink
        if let range = attributedString.range(of: "Tìm hiểu chuyện gì xảy ra khi số điện thoại của bạn thay đổi.") {
            
            attributedString[range].underlineStyle = .single
            attributedString[range].underlineColor = .gray
            attributedString[range].font = .system(size: 17)
            attributedString[range].link = .init(string: "https://policies.tinder.com/terms/intl/vi")
            attributedString[range].foregroundColor = .gray
        }
        return attributedString
    }
}
