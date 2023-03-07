//
//  ViewController.swift
//  pokemon-tcg-assistant
//
//  Created by Gabriel Santiago on 15/02/23.
//

import UIKit

class HomeViewController: UIViewController {

    let homeView = HomeView()

    override func loadView() {
        super.loadView()
        view = homeView
        homeView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension HomeViewController: HomeViewDelegate {
    func navigate(card: PokemonCard) {
        let nextViewController = CardViewController()
        nextViewController.cardView.delegate = self
        nextViewController.cardView.configureView(with: card)
        present(nextViewController, animated: true)
    }
}
extension HomeViewController: CardViewDelegate {
    func dismiss() {
        dismiss(animated: true)
    }
}

