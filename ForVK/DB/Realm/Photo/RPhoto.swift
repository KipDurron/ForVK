//
//  RPhoto.swift
//  ForVK
//
//  Created by Илья Кадыров on 11.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation
import RealmSwift

class RPhoto: Object {
   @objc dynamic var url: String? = nil
   @objc dynamic var countLike: Int = 0
    @objc dynamic var id: String = "0"
    @objc dynamic var userId: String = "0"
}
