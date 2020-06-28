//
//  likeControl.swift
//  ForVK
//
//  Created by Илья Кадыров on 28.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

@IBDesignable class likeControl: UIControl {

   @IBInspectable var isLiked: Bool = false {
        didSet {
            updateLike()
        }
    }
    
    @IBInspectable var countLikes: Int = 0 {
        didSet {
            self.countLabel.text = "\(self.countLikes)"
        }
    }
    
    lazy var countLabel: UILabel = {
        let countLabel = UILabel()
        countLabel.text = "\(self.countLikes)"
        countLabel.textColor = .blue
        return countLabel
    }()
    
    lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        return likeButton
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    @objc private func onTap() {
        self.isLiked.toggle()
    }
    
    private func updateLike() {
        let imageName: String
        let colorElem: UIColor
        if isLiked {
            imageName = "heart.fill"
            colorElem = .red
            self.countLikes += 1
        } else {
            imageName = "heart"
            self.countLikes -= 1
            colorElem = .blue
        }
        self.likeButton.setImage(UIImage(systemName: imageName), for: .normal)
        self.likeButton.tintColor = colorElem
        self.countLabel.textColor = colorElem
    
    }
    
    private func setup() {
        self.backgroundColor = .clear
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
        ])
        stackView.addArrangedSubview(countLabel)
        stackView.addArrangedSubview(likeButton)
    }
    
    public override init(frame: CGRect) {
           super.init(frame: frame)
           setup()
       }

       public required init?(coder: NSCoder) {
           super.init(coder: coder)
           setup()
       }
}
