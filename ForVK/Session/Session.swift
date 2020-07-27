//
//  Session.swift
//  ForVK
//
//  Created by Илья Кадыров on 27.07.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

class Session {
    var token: String = ""
    var userId: Int = 0
    static let instance = Session()

    private init(){}
}
