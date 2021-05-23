//
//  NewsCell.swift
//  ForVK
//
//  Created by Илья Кадыров on 19.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class NewsPhotoCell: UITableViewCell {

//    lazy var avatarAuthor: UIImageView = {
//        avatarAuthor = UIImageView()
//        avatarAuthor.translatesAutoresizingMaskIntoConstraints = false
//        return avatarAuthor
//    }()
//
//
//    lazy var nameAuthor: UILabel = {
//        nameAuthor = UILabel()
//        nameAuthor.translatesAutoresizingMaskIntoConstraints = false
//        return nameAuthor
//    }()
//
//    lazy var date: UILabel = {
//        date = UILabel()
//        date.translatesAutoresizingMaskIntoConstraints = false
//        return date
//    }()
//
//    lazy var dateFormatter: DateFormatter = {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd.MM.yyyy"
//        return dateFormatter
//    }()

    lazy var newsHeader: NewsHeader = {
        newsHeader = NewsHeader()
        newsHeader.translatesAutoresizingMaskIntoConstraints = false
        return newsHeader
    }()
    
    lazy var photo: UIImageView = {
        photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
    }
    
    
    func addView() {
        self.contentView.addSubview(newsHeader)
        self.contentView.addSubview(photo)
        NSLayoutConstraint.activate([
            newsHeader.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            newsHeader.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            newsHeader.heightAnchor.constraint(equalToConstant: 50),
            newsHeader.trailingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: -10),
            newsHeader.bottomAnchor.constraint(equalTo: self.photo.topAnchor, constant: -10),


//            photo.leadingAnchor.constraint(equalTo: self.newsHeader.leadingAnchor),
            photo.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
//            photo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            photo.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            
            photo.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.7),
            photo.heightAnchor.constraint(equalTo: self.photo.widthAnchor, multiplier: 1.2)


        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: PhotoNews, dateFormatter: DateFormatter) {
        UIImage.load(from: item.sourseData?.avatarUrl) {image in
            self.newsHeader.avatarAuthor.image = image
        }
        self.newsHeader.nameAuthor.text = item.sourseData?.name
        self.newsHeader.date.text = dateFormatter.string(from: item.date)
        UIImage.load(from: item.photoUrl) {image in
            self.photo.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    

}
