//
//  NewsCell.swift
//  ForVK
//
//  Created by Илья Кадыров on 22.05.2021.
//  Copyright © 2021 Илья Ишунин. All rights reserved.
//

import UIKit

class NewsHeader: UIView {
    
    lazy var avatarAuthor: UIImageView = {
        avatarAuthor = UIImageView()
        avatarAuthor.translatesAutoresizingMaskIntoConstraints = false
        return avatarAuthor
    }()
    
    
    lazy var nameAuthor: UILabel = {
        nameAuthor = UILabel()
        nameAuthor.translatesAutoresizingMaskIntoConstraints = false
        return nameAuthor
    }()
    
    lazy var date: UILabel = {
        date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        self.addSubview(avatarAuthor)
        self.addSubview(nameAuthor)
        self.addSubview(date)
        NSLayoutConstraint.activate([
            avatarAuthor.topAnchor.constraint(equalTo: self.topAnchor),
            avatarAuthor.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            avatarAuthor.widthAnchor.constraint(equalToConstant: 50),
            avatarAuthor.heightAnchor.constraint(equalToConstant: 50),
            avatarAuthor.trailingAnchor.constraint(equalTo: self.nameAuthor.leadingAnchor, constant: -20),
            avatarAuthor.bottomAnchor.constraint(equalTo: self.bottomAnchor),


            nameAuthor.heightAnchor.constraint(equalTo: date.heightAnchor),
            

            date.topAnchor.constraint(equalTo: self.nameAuthor.bottomAnchor, constant: 10),
            date.leadingAnchor.constraint(equalTo: self.nameAuthor.leadingAnchor),
            date.bottomAnchor.constraint(equalTo: self.avatarAuthor.bottomAnchor),
            date.heightAnchor.constraint(equalToConstant: 20),
            
//            self.heightAnchor.constraint(equalTo: avatarAuthor.heightAnchor)

        ])
    }
    

}
