//
//  SourseData.swift
//  ForVK
//
//  Created by Илья Кадыров on 06.11.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation

protocol SourseData {
    var id: String { get set}
    var name: String { get set}
    var avatarUrl: String? { get set}
}
