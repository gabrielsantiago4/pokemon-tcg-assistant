//
//  HomeViewControllerRefactored.swift
//  pokemon-tcg-assistant
//
//  Created by Gabriel Santiago on 07/03/23.
//

import UIKit

class HomeViewControllerRefactored: UIViewController {

    var homeViewRefactored = HomeViewRefactored()
    var pokemonCards: [PokemonCard] = []

    override func loadView() {
        view = homeViewRefactored
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewRefactored.collectionView.delegate = self
        homeViewRefactored.collectionView.dataSource = self
        homeViewRefactored.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionviewcell")
        API().getAllCards { card in
            self.pokemonCards = card.data
            DispatchQueue.main.async {
                self.homeViewRefactored.collectionView.reloadData()
            }
        }
    }
}

extension HomeViewControllerRefactored: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = pokemonCards[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionviewcell", for: indexPath) as! CollectionViewCell
        cell.label.text = card.name
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 210)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = pokemonCards[indexPath.row]
        let nextViewController = CardViewController()
        nextViewController.cardView.configureView(with: card)
        nextViewController.cardView.delegate = self
        present(nextViewController, animated: true)
    }
}
extension HomeViewControllerRefactored: CardViewDelegate{
    func dismiss() {
        dismiss(animated: true)
    }
}
