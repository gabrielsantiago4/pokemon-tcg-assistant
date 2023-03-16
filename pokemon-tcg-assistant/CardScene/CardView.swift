//
//  CardView.swift
//  pokemon-tcg-assistant
//
//  Created by Gabriel Santiago on 17/02/23.
//

import UIKit
import Kingfisher

class CardView: UIView {

    weak var delegate: CardViewDelegate?

    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Xicon"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    lazy var testImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()

    var label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = label.font.withSize(50)
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
//        testImage.image = UIImage(named: card.name)
        let url = URL(string: card.images.large)
        testImage.kf.setImage(with: url)
    }

    @objc func buttonAction () {
        delegate?.dismiss()
    }
}
extension CardView: ViewCoding {
    func setupHierarchy() {
        addSubview(testImage)
        addSubview(button)
        addSubview(label)

    }
    func configureConstraints() {
        NSLayoutConstraint.activate([
            testImage.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            testImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150),
            testImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            testImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),

            button.topAnchor.constraint(equalTo: testImage.bottomAnchor, constant: 50),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    func addConfigurations() {
        backgroundColor = UIColor.black.withAlphaComponent(0.9)
    }
}
