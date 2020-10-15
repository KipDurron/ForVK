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
    
    let realmSetting = RealmSetting()
    let realm: Realm
    
    init() {
        realm = realmSetting.getRealm()
    }
    
    func update(vkObject: User) -> String? {
        guard let updateUser = self.getById(id: vkObject.id) else {
            return nil
        }
        do {
            realm.beginWrite()
            updateUser.avatarUrl = vkObject.avatarUrl
            updateUser.name = vkObject.name
            try realm.commitWrite()
        } catch {
            debugPrint(error)
        }
        return updateUser.id
    }
    
    func saveAll(vkObjectList: [User]) {
        realm.beginWrite()
        do {
            for user in vkObjectList {
                if !self.checkExist(id: user.id) {
                    let rUser = RUser()
                    rUser.id = user.id
                    rUser.avatarUrl = user.avatarUrl
                    rUser.name = user.name
                    realm.add(rUser)
                } else {
                    let updateUser = self.getById(id: user.id)!
                    updateUser.avatarUrl = user.avatarUrl
                    updateUser.name = user.name
                }
            }
            try realm.commitWrite()
        } catch {
            debugPrint(error)
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
    
    func loadResult() -> Results<RUser> {
        return realm.objects(RUser.self)
    }
    
}

