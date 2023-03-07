//
//  HomeView.swift
//  pokemon-tcg-assistant
//
//  Created by Gabriel Santiago on 15/02/23.
//

import UIKit

class HomeView: UIView {

    weak var delegate: HomeViewDelegate?
    
    var pokemonCards: [PokemonCard] = []

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionviewcell")
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
        API().getAllCards{ cards in
            self.pokemonCards = cards.data
            print(cards.data)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension HomeView: ViewCoding {
    func setupHierarchy() {
        addSubview(collectionView)
    }
    func configureConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    func addConfigurations() {
        backgroundColor = .systemBackground
    }
}
extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cards = pokemonCards[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionviewcell", for: indexPath) as! CollectionViewCell
        cell.label.text = cards.name
        cell.testImage.image = UIImage(named: cards.name)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 210)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = pokemonCards[indexPath.item]
        delegate?.navigate(card: card)
    }
}
