//
//  RUserService.swift
//  ForVK
//
//  Created by Илья Кадыров on 11.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation
import RealmSwift

class RUserService: DBServiceInterface {
    
    typealias VKObject = User
    
    let realm: Realm
    
    init?() {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            self.realm = try Realm(configuration: config)
            debugPrint(realm.configuration.fileURL)
        } catch {
            debugPrint(error)
            return nil
        }
    }
    
    func save(vkObject: User) -> String? {
        do {
            if !self.checkExist(id: vkObject.id) {
                let rUser =  RUser()
                rUser.id = vkObject.id
                rUser.avatarUrl = vkObject.avatarUrl
                rUser.name = vkObject.name
                realm.beginWrite()
                realm.add(rUser)
                try realm.commitWrite()
                return vkObject.id
            }
        } catch {
            debugPrint(error)
        }
        return nil
    }
    
    func checkExist(id: String) -> Bool{
        if self.getById(id: id) != nil {
            return true
        } else {
            return false
        }
    }
    
    func getById(id: String) -> RUser? {
        return realm.objects(RUser.self).filter("id == %@", id).first
    }
    
    func load() -> [User] {
        return realm.objects(RUser.self).map{User(rUser: $0)}
    }
    
}

