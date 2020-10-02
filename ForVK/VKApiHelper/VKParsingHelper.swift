//
//  VKParsingHelper.swift
//  ForVK
//
//  Created by Илья Кадыров on 02.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation

class VKParsingHelper {
    static func getItems(data: Any) -> [[String: Any]] {
        let dictJson = data as! [String: Any]
        let responseJson = dictJson["response"] as! [String: Any]
        return responseJson["items"] as! [[String: Any]]
    }
}
