//
//  WelcomeCell.swift
//  ChatAppDemo
//
//  Created by Thien Vu on 03/01/2022.
//

import Foundation
import UIKit

class WelcomeCell : UICollectionViewCell {
    
    var sectionImage = UIImageView()
    var sectionLabel = UILabel()
    var descriptionSection = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        sectionImage.image = nil
        sectionLabel.text = nil
        descriptionSection.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSectionImage()
        setupSectionLabel()
        setupDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configured(_ section:WelcomeModel) {
        sectionImage.image = UIImage(named: section.imageName!)
        sectionLabel.text = section.title
        descriptionSection.text = section.discription
        
        print("TV: \(section.imageName!) - \(section.title) - \(section.discription)")
        if section.title == "Start Messaging" {
            sectionImage.removeFromSuperview()
            sectionLabel.removeFromSuperview()
            descriptionSection.removeFromSuperview()
        }
    }

    
    private func setupSectionImage() {
        contentView.addSubview(sectionImage)
        sectionImage.translatesAutoresizingMaskIntoConstraints = false
        sectionImage.contentMode = .scaleAspectFill
        sectionImage.layer.masksToBounds = true
        sectionImage.layer.cornerRadius = 75
        
        let contraints = [
            sectionImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            sectionImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -center.y/2),
            sectionImage.widthAnchor.constraint(equalToConstant: 150),
            sectionImage.heightAnchor.constraint(equalToConstant: 150)
        ]
        NSLayoutConstraint.activate(contraints)
    }
    
    private func setupSectionLabel() {
        contentView.addSubview(sectionLabel)
        sectionLabel.translatesAutoresizingMaskIntoConstraints  = false
        sectionLabel.font = UIFont(name: "Alata", size: 28)
        sectionLabel.textAlignment = .center
        let contraints = [
            sectionLabel.topAnchor.constraint(equalTo: sectionImage.bottomAnchor, constant: 10),
            sectionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        NSLayoutConstraint.activate(contraints)
    }
    
    private func setupDescriptionLabel() {
        contentView.addSubview(descriptionSection)
        descriptionSection.translatesAutoresizingMaskIntoConstraints = false
        descriptionSection.textColor = .gray
        descriptionSection.textAlignment = .center
        descriptionSection.numberOfLines = 0
        descriptionSection.font = UIFont(name: "Alata", size: 18)
        let constraints = [
            descriptionSection.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionSection.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 8),
            descriptionSection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionSection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
