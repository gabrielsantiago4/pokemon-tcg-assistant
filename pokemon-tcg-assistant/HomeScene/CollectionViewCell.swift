//
//  CollectionViewCell.swift
//  pokemon-tcg-assistant
//
//  Created by Gabriel Santiago on 15/02/23.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {

    lazy var testImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configCell(with card: PokemonCard) {
        let url = URL(string: card.images.small)
        testImage.kf.setImage(with: url)
    }

}
extension CollectionViewCell: ViewCoding{
    func setupHierarchy() {
        contentView.addSubview(testImage)
    }
    func configureConstraints() {
        NSLayoutConstraint.activate([
            testImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            testImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            testImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            testImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    func addConfigurations() {
        contentView.backgroundColor = .systemBackground
    }
}
