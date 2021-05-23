//
//  UserGroupsCell.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class GroupsCell: UITableViewCell {

    lazy var avatar: UIImageView = {
        avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    lazy var name: UILabel = {
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
    }
    
    func addView() {
        self.addSubview(avatar)
        self.addSubview(name)
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
//            avatar.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            avatar.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
//            avatar.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 50),
            avatar.heightAnchor.constraint(equalToConstant: 50),
            avatar.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),

            name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 20),
            name.bottomAnchor.constraint(equalTo: avatar.bottomAnchor),
            name.heightAnchor.constraint(equalToConstant: 20),
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
