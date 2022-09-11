//
//  PhoneNumberCodeInfo.swift
//  Tinder-FE
//
//  Created by Gia Huy on 06/09/2022.
//

import Foundation
struct NumberCodeAreaInfo: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var shortenedName: String
    var nationCodeNumber: String
}

var codeNumbers = decodeJsonFromJsonFile(jsonFileName: "CodeNumber.json")

func decodeJsonFromJsonFile(jsonFileName: String) -> [NumberCodeAreaInfo] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([NumberCodeAreaInfo].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [NumberCodeAreaInfo]
}
