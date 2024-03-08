//
//  VerticalCollectionViewCell.swift
//  4hw8
//
//  Created by Telegey Nurbekova on 08/03/24.
//

import UIKit

class VerticalCollectionViewCell: UICollectionViewCell {
    
    private let logoImage = MakerView.shared.makerImage()
    private let nameLabel = MakerView.shared.makerLabel(font: .systemFont(ofSize: 15, weight: .semibold), textColor: .black, textAlignment: .left)
    private let personLabel = MakerView.shared.makerLabel(font: .systemFont(ofSize: 12, weight: .light), textColor: .darkGray, textAlignment: .left)
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        configureImageView()
    }
    
    private func configureImageView(){
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            logoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            logoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -75)
        ])
        
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor,constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
        contentView.addSubview(personLabel)
        NSLayoutConstraint.activate([
            personLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 5),
            personLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            personLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
    }
    
    func setData(items: Item){
        logoImage.image = items.logo
        nameLabel.text = items.name
        personLabel.text = items.person
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
