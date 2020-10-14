//
//  CDGroupService.swift
//  ForVK
//
//  Created by Илья Кадыров on 04.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation
import CoreData
class CDGroupService: DBServiceInterface {
    
    typealias VKObject = Group
    
    let coreData = CoreData()
    
    func update(vkObject: Group) -> String? {
        guard let updateGroup = self.getById(id: vkObject.id) else {
            return nil
        }
        updateGroup.avatarUrl = URL(string: vkObject.avatarUrl ?? "")
        updateGroup.name = vkObject.name
        coreData.saveContext()
        return updateGroup.id
    }
    
    func saveAll(vkObjectList: [Group]) {
        for group in vkObjectList {
            if !self.checkExist(id: group.id) {
                let newGroup = CDGroup(context: coreData.getVeiwContext())
                newGroup.avatarUrl = URL(string: group.avatarUrl ?? "")
                newGroup.id = group.id
                newGroup.name = group.name
            } else {
                let updateGroup = self.getById(id: group.id)!
                updateGroup.avatarUrl = URL(string: group.avatarUrl ?? "")
                updateGroup.name = group.name
            }
        }
        coreData.saveContext()
    }
    
    func save(vkObject: Group) -> String? {
        if !self.checkExist(id: vkObject.id) {
            let newGroup = CDGroup(context: coreData.getVeiwContext())
            newGroup.avatarUrl = URL(string: vkObject.avatarUrl ?? "")
            newGroup.id = vkObject.id
            newGroup.name = vkObject.name
            coreData.saveContext()
            return newGroup.id
        } else {
            let updateGroup = self.getById(id: vkObject.id)!
            updateGroup.avatarUrl = URL(string: vkObject.avatarUrl ?? "")
            updateGroup.name = vkObject.name
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
    
    func load() -> [Group] {
        do {
            let fetchReq: NSFetchRequest<CDGroup> = CDGroup.fetchRequest()
            let cdGroupList = try coreData.getVeiwContext().fetch(fetchReq) as? [CDGroup] ?? []
            return cdGroupList.map{Group(cdGroup: $0)}
        } catch {
            debugPrint("dont load data of Group from DB")
            return []
        }
    }
}
