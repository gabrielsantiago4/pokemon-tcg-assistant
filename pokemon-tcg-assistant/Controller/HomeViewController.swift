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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

