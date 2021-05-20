//
//  FriendsCell.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {


    var avatarView = AvatarView()
    var name = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        config()
    }
    
    
    func config() {
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
        self.addSubview(avatarView)
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            avatarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            avatarView.trailingAnchor.constraint(equalTo: name.leadingAnchor, constant: -50),
            avatarView.widthAnchor.constraint(equalToConstant: 50),
            avatarView.heightAnchor.constraint(equalToConstant: 50),
            avatarView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            name.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            name.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor),
        ])
    
    }
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

}
