//
//  AvatarView.swift
//  ForVK
//
//  Created by Илья Кадыров on 23.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
// UIImage(systemName: "person.fill")

import UIKit

class AvatarView: UIView {
    
   var shadowRadius: CGFloat = 1 {
        didSet {
            updateShadow()
        }
    }
    
   var shadowColor: UIColor = .black {
        didSet {
            updateShadow()
        }
    }
    
    var shadowOpacity: Float = 1 {
        didSet {
            updateShadow()
        }
    }
    
    var avatarImage: UIImage? = nil {
        didSet {
            imageView.image = avatarImage
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    lazy var shadowView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.backgroundColor = .white
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        print(#function)
        setup()
    }
    
//    public  override init(frame: CGRect) {
//        super.init(frame: frame)
//        print(#function)
//        setup()
//    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(#function)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        shadowView.layer.cornerRadius = shadowView.frame.width / 2
        updateShadow()
    }
    
    private func setup() {
        addSubview(shadowView)
        addSubview(imageView)
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            shadowView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            shadowView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
        ])
    }
    
    private func updateShadow() {
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOpacity = shadowOpacity
        shadowView.layer.shadowRadius = shadowRadius
    }
    
}

