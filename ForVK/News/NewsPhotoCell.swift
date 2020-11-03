//
//  NewsCell.swift
//  ForVK
//
//  Created by Илья Кадыров on 19.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class NewsPhotoCell: UITableViewCell {


    @IBOutlet weak var avatarAuthor: UIImageView!
    
    @IBOutlet weak var nameAuthor: UILabel!

    @IBOutlet weak var date: UILabel!

    @IBOutlet weak var img: UIImageView!
    
    func configure(item: News, dateFormatter: DateFormatter) {
//        avatarAuthor.image = item.author.avatar
//        nameAuthor.text = item.author.name
//        date.text = dateFormatter.string(from: item.date)
//        textNews.text = item.text
//        textNews.numberOfLines = 0
//        img.image = item.img
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
