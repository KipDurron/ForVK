//
//  DBServiceInterface.swift
//  ForVK
//
//  Created by Илья Кадыров on 11.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation

protocol DBServiceInterface {
    associatedtype VKObject
    
    func save(vkObject: VKObject) -> String?
    func load() -> [VKObject]
    func saveAll(vkObjectList: [VKObject])
    
}
