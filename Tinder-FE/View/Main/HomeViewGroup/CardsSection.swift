//
//  CardsSection.swift
//  Tinder-FE
//
//  Created by Gia Huy on 09/09/2022.
//

import SwiftUI

struct CardsSection: View {
    var body: some View {
        ZStack{
            ForEach(Card.data.reversed()) { card in
                CardView(card: card)
            }
        }
        .padding(10)
        .zIndex(1.0)
    }
}

struct CardsSection_Previews: PreviewProvider {
    static var previews: some View {
        CardsSection()
    }
}
