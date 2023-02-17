//
//  API.swift
//  pokemon-tcg-assistant
//
//  Created by Gabriel Santiago on 15/02/23.
//

import Foundation

struct API{

    func getAllCards(completion: @escaping (CardsData) -> Void) {

        guard let url = URL(string: "https://api.pokemontcg.io/v2/cards") else { return }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) {data, response, error in
            guard let responseData = data else {
                return
            }
            do {
                let cards = try JSONDecoder().decode(CardsData.self, from: responseData)
                completion(cards)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
