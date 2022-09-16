//
//  HomeViewModel.swift
//  Tinder-FE
//
//  Created by Gia Huy on 16/09/2022.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var data: [Card] = []
    
    @Published var displayData: [Card]?
    
    init() {
        
        data = [
            Card(name: "Gin", imageName: "gin", age: 23, state: "Netherlands"),
            Card(name: "Vodka", imageName: "vodka", age: 26, state: "Russia"),
            Card(name: "Rum", imageName: "rum", age: 20, state: "Caribbean"),
            Card(name: "Tequila", imageName: "tequila", age: 21, state: "Mexico"),
            Card(name: "Chianti", imageName: "chianti", age: 21, state: "Italy"),
            Card(name: "Love You", imageName: "testImg", age: 21, state: "Italy"),
        ]
        
        displayData = data
    }
}
