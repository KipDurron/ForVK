//
//  RUserService.swift
//  ForVK
//
//  Created by Илья Кадыров on 11.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation
import RealmSwift

class RGroupService: DBServiceInterface {
    
    typealias VKObject = Group
    
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
    
    func save(vkObject: Group) -> String? {
        do {
            if !self.checkExist(id: vkObject.id) {
                let rGroup =  RGroup()
                rGroup.id = vkObject.id
                rGroup.avatarUrl = vkObject.avatarUrl
                rGroup.name = vkObject.name
                realm.beginWrite()
                realm.add(rGroup)
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
    
    func getById(id: String) -> RGroup? {
        return realm.objects(RGroup.self).filter("id == %@", id).first
    }
    
    func load() -> [Group] {
        return realm.objects(RGroup.self).map{Group(rGroup: $0)}
    }
    
}

