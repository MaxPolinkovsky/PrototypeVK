//
//  PageCell.swift
//  prototypeVK
//
//  Created by Max Polinkovsky on 18.01.2021.
//

import UIKit

class PageCell: UICollectionViewCell {

    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "theory_image")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var pageLabelText: UILabel = {
        let pageText = UILabel()
        pageText.text = "Create your themes or use predefined"
        pageText.font = UIFont(name: "AvenirNext-Medium", size: 30)
        pageText.numberOfLines = 2
        pageText.textAlignment = .center
        pageText.translatesAutoresizingMaskIntoConstraints = false
        return pageText
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addInSubwiews()
        setupLayout()
    }
    
    private func addInSubwiews() {
        addSubview(imageView)
        addSubview(pageLabelText)
    }
    
    private func setupLayout() {

        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    
        pageLabelText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageLabelText.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pageLabelText.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
