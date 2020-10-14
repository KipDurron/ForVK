//
//  RGroupService.swift
//  ForVK
//
//  Created by Илья Кадыров on 11.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation
import RealmSwift

class RGroupService: DBServiceInterface {
    
    typealias VKObject = Group
    
    let realmSetting = RealmSetting()
    let realm: Realm
    
    init() {
        realm = realmSetting.getRealm()
    }
    
    func update(vkObject: Group) -> String? {
        guard let updateGroup = self.getById(id: vkObject.id) else {
            return nil
        }
        do {
            realm.beginWrite()
            updateGroup.avatarUrl = vkObject.avatarUrl
            updateGroup.name = vkObject.name
            try realm.commitWrite()
        } catch {
            debugPrint(error)
        }
        return updateGroup.id
    }
    
    func saveAll(vkObjectList: [Group]) {
        realm.beginWrite()
        do {
            for group in vkObjectList {
                if !self.checkExist(id: group.id) {
                    let rGroup = RGroup()
                    rGroup.id = group.id
                    rGroup.avatarUrl = group.avatarUrl
                    rGroup.name = group.name
                    realm.add(rGroup)
                } else {
                    let updateGroup = self.getById(id: group.id)!
                    updateGroup.avatarUrl = group.avatarUrl
                    updateGroup.name = group.name
                }
            }
            try realm.commitWrite()
        } catch {
            debugPrint(error)
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

