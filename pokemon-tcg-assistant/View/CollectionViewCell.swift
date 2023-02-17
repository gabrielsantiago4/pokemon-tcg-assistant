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
    }
    func configureConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    func addConfigurations() {
        contentView.backgroundColor = .red
    }


}
