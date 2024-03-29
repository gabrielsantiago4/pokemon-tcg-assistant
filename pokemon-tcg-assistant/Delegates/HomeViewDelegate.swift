//
//  Delegate.swift
//  pokemon-tcg-assistant
//
//  Created by Gabriel Santiago on 17/02/23.
//

import Foundation


protocol HomeViewDelegate: AnyObject {
    func navigate(card: PokemonCard)
}
