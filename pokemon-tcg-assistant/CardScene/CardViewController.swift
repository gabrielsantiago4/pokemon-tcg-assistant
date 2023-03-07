//
//  CardViewController.swift
//  pokemon-tcg-assistant
//
//  Created by Gabriel Santiago on 17/02/23.
//

import UIKit

class CardViewController: UIViewController {

    var cardView = CardView()

    override func loadView() {
        super.loadView()
        view = cardView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
