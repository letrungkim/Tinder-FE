//
//  CardModel.swift
//  Tinder-FE
//
//  Created by Gia Huy on 09/09/2022.
//

import Foundation
import UIKit

struct Card: Identifiable {
    let id = UUID().uuidString
    let name: String
    let imageName: String
    let age: Int
    let state: String
    let activeStatus: [String] = ["Có hoạt động gần đây", "hoạt động ngoại tuyến"]
}
