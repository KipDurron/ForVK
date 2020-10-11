//
//  CDUserService.swift
//  ForVK
//
//  Created by Илья Кадыров on 04.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation
import CoreData
class CDUserService {
    
    let coreData = CoreData()
    
    func save(user: User) {
        if !self.checkExist(id: user.id) {
            let newUser = CDUser(context: coreData.getVeiwContext())
            newUser.avatarUrl = URL(string: user.avatarUrl ?? "")
            newUser.id = user.id
            newUser.name = user.name
            coreData.saveContext()
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
    
    func load() -> [CDUser] {
        do {
            let fetchReq: NSFetchRequest<CDUser> = CDUser.fetchRequest()
            return try coreData.getVeiwContext().fetch(fetchReq) as? [CDUser] ?? []
        } catch {
            debugPrint("dont load data of User from DB")
            return []
        }
    }
}
