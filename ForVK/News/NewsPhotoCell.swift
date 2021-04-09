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
    
    func configure(item: PhotoNews, dateFormatter: DateFormatter) {
        UIImage.load(from: item.sourseData?.avatarUrl) {image in
            self.avatarAuthor.image = image
        }
        self.nameAuthor.text = item.sourseData?.name
        self.date.text = dateFormatter.string(from: item.date)
        UIImage.load(from: item.photoUrl) {image in
            self.img.image = image
        }
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
