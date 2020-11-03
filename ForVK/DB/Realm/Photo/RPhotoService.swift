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
    
    let realmSetting = RealmSetting()
    let realm: Realm
    
    init() {
        realm = realmSetting.getRealm()
    }
    
    func update(vkObject: Photo) -> String? {
        guard let updatePhoto = self.getById(id: vkObject.id) else {
            return nil
        }
        do {
            realm.beginWrite()
            updatePhoto.url = vkObject.url
            updatePhoto.countLike = vkObject.countLike
            updatePhoto.userId = vkObject.userId
            try realm.commitWrite()
        } catch {
            debugPrint(error)
        }
        return updatePhoto.id
    }
    
    func saveAll(vkObjectList: [Photo]) {
        realm.beginWrite()
        do {
            for photo in vkObjectList {
                if !self.checkExist(id: photo.id) {
                    let rPhoto =  RPhoto()
                    rPhoto.id = photo.id
                    rPhoto.url = photo.url
                    rPhoto.countLike = photo.countLike
                    rPhoto.userId = photo.userId
                    realm.add(rPhoto)
                } else {
                    let updatePhoto = self.getById(id: photo.id)!
                    updatePhoto.url = photo.url
                    updatePhoto.countLike = photo.countLike
                    updatePhoto.userId = photo.userId
                }
            }
            try realm.commitWrite()
        } catch {
            debugPrint(error)
        }
    }
    
    func save(vkObject: Photo) -> String? {
        do {
            if !self.checkExist(id: vkObject.id) {
                let rPhoto =  RPhoto()
                rPhoto.id = vkObject.id
                rPhoto.url = vkObject.url
                rPhoto.countLike = vkObject.countLike
                rPhoto.userId = vkObject.userId
                realm.beginWrite()
                realm.add(rPhoto)
                try realm.commitWrite()
                return vkObject.id
            } else {
                self.update(vkObject: vkObject)
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
    
    func loadByUser(userId: String) -> [Photo] {
        return realm.objects(RPhoto.self).filter("userId == %@", userId).map{Photo(rPhoto: $0)}
    }
    
    func loadResult() -> Results<RPhoto> {
        return realm.objects(RPhoto.self)
    }
    
    func loadResultByUser(userId: String) -> Results<RPhoto> {
        return realm.objects(RPhoto.self).filter("userId == %@", userId)
    }
    
}

