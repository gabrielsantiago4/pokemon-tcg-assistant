//
//  ViewCoding.swift
//  pokemon-tcg-assistant
//
//  Created by Gabriel Santiago on 15/02/23.
//

import Foundation

protocol ViewCoding {
    func setupHierarchy()
    func configureConstraints()
    func addConfigurations()
}
extension ViewCoding {
    func buildView(){
        setupHierarchy()
        configureConstraints()
        addConfigurations()
    }
}
