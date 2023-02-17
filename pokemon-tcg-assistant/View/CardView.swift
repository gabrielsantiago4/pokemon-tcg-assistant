//
//  CardView.swift
//  pokemon-tcg-assistant
//
//  Created by Gabriel Santiago on 17/02/23.
//

import UIKit

class CardView: UIView {

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "PLACEHOLDER"
        label.font = label.font.withSize(40)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView(with card: PokemonCard){
        label.text = card.name
    }

}
extension CardView: ViewCoding {
    func setupHierarchy() {
        addSubview(label)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func addConfigurations() {
        backgroundColor = .white
    }


}
