//
//  CDUserService.swift
//  ForVK
//
//  Created by Илья Кадыров on 04.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation
import CoreData
class CDUserService: DBServiceInterface {
    
    typealias VKObject = User
        
    let coreData = CoreData()
    
    func update(vkObject: User) -> String? {
        guard let updateUser = self.getById(id: vkObject.id) else {
            return nil
        }
        updateUser.avatarUrl = URL(string: vkObject.avatarUrl ?? "")
        updateUser.name = vkObject.name
        coreData.saveContext()
        return updateUser.id
    }
    
    func saveAll(vkObjectList: [User]) {
        for user in vkObjectList {
            if !self.checkExist(id: user.id) {
                let newUser = CDUser(context: coreData.getVeiwContext())
                newUser.avatarUrl = URL(string: user.avatarUrl ?? "")
                newUser.id = user.id
                newUser.name = user.name
            } else {
                let updateUser = self.getById(id: user.id)!
                updateUser.avatarUrl = URL(string: user.avatarUrl ?? "")
                updateUser.name = user.name
            }
        }
        coreData.saveContext()
    }
    
    func save(vkObject: User) -> String? {
        if !self.checkExist(id: vkObject.id) {
            let newUser = CDUser(context: coreData.getVeiwContext())
            newUser.avatarUrl = URL(string: vkObject.avatarUrl ?? "")
            newUser.id = vkObject.id
            newUser.name = vkObject.name
            coreData.saveContext()
            return newUser.id
        } else {
            let updateUser = self.getById(id: vkObject.id)!
            updateUser.avatarUrl = URL(string: vkObject.avatarUrl ?? "")
            updateUser.name = vkObject.name
            coreData.saveContext()
            return nil
        }
    }
    
    func checkExist(id: String) -> Bool{
        if self.getById(id: id) != nil {
            return true
        } else {
            return false
        }
    }
    
    func getById(id: String) -> CDUser? {
        let fetchReq: NSFetchRequest<CDUser> = CDUser.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", id)
        fetchReq.predicate = predicate
        do {
            return try coreData.getVeiwContext().fetch(fetchReq).first
        } catch {
            debugPrint("dont load data of User from DB by id: \(id)")
            return nil
        }
    }
    
    func load() -> [User] {
        do {
            let fetchReq: NSFetchRequest<CDUser> = CDUser.fetchRequest()
            let cdUserList = try coreData.getVeiwContext().fetch(fetchReq) as? [CDUser] ?? []
            return cdUserList.map{User(cdUser: $0)}
            
        } catch {
            debugPrint("dont load data of User from DB")
            return []
        }
    }
}
