//
//  PhotosCell.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class PhotosCell: UICollectionViewCell {
    
   lazy var photo: UIImageView  = {
        let photoTmp = UIImageView()
        photoTmp.translatesAutoresizingMaskIntoConstraints = false
        return photoTmp
    }()
    
   lazy var likeControl: LikeControl = {
        let likeControlTmp = LikeControl()
        likeControlTmp.translatesAutoresizingMaskIntoConstraints = false
        return likeControlTmp
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        
        addView()
        }
    
    
    func addView() {
        self.addSubview(photo)
        self.addSubview(likeControl)
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: self.topAnchor),
            photo.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),

            likeControl.trailingAnchor.constraint(equalTo: photo.trailingAnchor),
            likeControl.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            likeControl.heightAnchor.constraint(equalToConstant: 30),
        ])
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
