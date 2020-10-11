//
//  RUserService.swift
//  ForVK
//
//  Created by Илья Кадыров on 11.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation
import RealmSwift

class RPhotoService: DBServiceInterface {
    
    typealias VKObject = Photo
    
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
    
    func save(vkObject: Photo) -> String? {
        do {
            if !self.checkExist(id: vkObject.id) {
                let rPhoto =  RPhoto()
                rPhoto.id = vkObject.id
                rPhoto.url = vkObject.url
                rPhoto.countLike = vkObject.countLike
                realm.beginWrite()
                realm.add(rPhoto)
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
    
    func getById(id: String) -> RPhoto? {
        return realm.objects(RPhoto.self).filter("id == %@", id).first
    }
    
    func load() -> [Photo] {
        return realm.objects(RPhoto.self).map{Photo(rPhoto: $0)}
    }
    
}

