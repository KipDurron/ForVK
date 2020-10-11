//
//  CDGroupService.swift
//  ForVK
//
//  Created by Илья Кадыров on 04.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation
import CoreData
class CDGroupService {
    
    let coreData = CoreData()
    
    func save(group: Group) {
        if !self.checkExist(id: group.id) {
            let newGroup = CDGroup(context: coreData.getVeiwContext())
            newGroup.avatarUrl = URL(string: group.avatarUrl ?? "")
            newGroup.id = group.id
            newGroup.name = group.name
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
    
    func getById(id: String) -> CDGroup? {
        let fetchReq: NSFetchRequest<CDGroup> = CDGroup.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", id)
        fetchReq.predicate = predicate
        do {
            return try coreData.getVeiwContext().fetch(fetchReq).first
        } catch {
            debugPrint("dont load data of Group from DB by id: \(id)")
            return nil
        }
    }
    
    func load() -> [CDGroup] {
        do {
            let fetchReq: NSFetchRequest<CDGroup> = CDGroup.fetchRequest()
            return try coreData.getVeiwContext().fetch(fetchReq) as? [CDGroup] ?? []
        } catch {
            debugPrint("dont load data of Group from DB")
            return []
        }
    }
}
