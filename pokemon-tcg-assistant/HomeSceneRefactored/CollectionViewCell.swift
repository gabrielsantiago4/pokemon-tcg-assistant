//
//  CollectionViewCell.swift
//  pokemon-tcg-assistant
//
//  Created by Gabriel Santiago on 15/02/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CARD"
        label.textColor = .black
        return label
    }()
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

}
extension CollectionViewCell: ViewCoding{
    func setupHierarchy() {
        contentView.addSubview(label)
        contentView.addSubview(testImage)
    }
    func configureConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            testImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            testImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            testImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            testImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    func addConfigurations() {
        contentView.backgroundColor = .red
    }
}
