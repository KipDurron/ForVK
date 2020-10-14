//
//  PhotoService.swift
//  ForVK
//
//  Created by Илья Кадыров on 28.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//
import Alamofire

class PhotoService {
    
    func getAllphotoUser(idUser: String, completion: @escaping ([Photo]) -> Void) {
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKSet.scheme.rawValue
        urlConstructor.host = VKSet.host.rawValue
        urlConstructor.path = VKSet.methodGetPhotoUser.rawValue
        urlConstructor.queryItems = [
                    URLQueryItem(name: "access_token", value: Session.instance.token),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "album_id", value: "saved"),
                    URLQueryItem(name: "owner_id", value: idUser),
                    URLQueryItem(name: "extended", value: "1")
                ]
        
        AF.request(urlConstructor.url!).responseJSON { response in
            guard let data = response.value else { return }
            let items = VKParsingHelper.getItems(data: data)
            completion(self.parsingPhotosUser(items: items, idUser: idUser))
        }
    }
    
    func parsingPhotosUser(items: [[String: Any]], idUser: String) -> [Photo] {
        
        var photoArr: [Photo] = []
        items.forEach({ item in
            photoArr.append(Photo(jsonDict: item, userId: idUser))
        })
        return photoArr
    }
    
}
