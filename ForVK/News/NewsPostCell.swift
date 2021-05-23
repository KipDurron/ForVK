//
//  NewsPostCell.swift
//  ForVK
//
//  Created by Илья Кадыров on 03.11.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class NewsPostCell: UITableViewCell {

    lazy var newsHeader: NewsHeader = {
        newsHeader = NewsHeader()
        newsHeader.translatesAutoresizingMaskIntoConstraints = false
        return newsHeader
    }()
    
    lazy var post: UITextView = {
        post = UITextView()
        post.translatesAutoresizingMaskIntoConstraints = false
        return post
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
    }
    
    func addView() {
        self.contentView.addSubview(newsHeader)
        self.contentView.addSubview(post)
        NSLayoutConstraint.activate([
            newsHeader.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            newsHeader.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            newsHeader.heightAnchor.constraint(equalToConstant: 50),
            newsHeader.trailingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: -10),
            newsHeader.bottomAnchor.constraint(equalTo: self.post.topAnchor, constant: -10),


            post.leadingAnchor.constraint(equalTo: self.newsHeader.leadingAnchor),
            post.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            post.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),

//            post.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.7),
            post.heightAnchor.constraint(equalToConstant: 320)
//            post.heightAnchor.constraint(equalToConstant: self.post.calculateViewHeightWithCurrentWidth()),
//            post.widthAnchor.constraint(equalToConstant: 320)
        ])

    }
    
//    func calcHieghtTextView(textView: UITextView) -> CGFloat {
//        let sizeThatFitsTextView = textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: CGFloat(MAXFLOAT)))
//        return sizeThatFitsTextView.height
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(item: PostNews, dateFormatter: DateFormatter) {
        UIImage.load(from: item.sourseData?.avatarUrl) {image in
            self.newsHeader.avatarAuthor.image = image
        }
        self.newsHeader.nameAuthor.text = item.sourseData?.name
        self.newsHeader.date.text = dateFormatter.string(from: item.date)
        self.post.text = item.post
    }

}
