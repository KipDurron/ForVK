//
//  PhotoService.swift
//  ForVK
//
//  Created by Илья Кадыров on 28.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//
import Alamofire

class PhotoService {
    
    func getPhotoUser(idUser: Int) {
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKWebSet.scheme.rawValue
        urlConstructor.host = VKWebSet.host.rawValue
        urlConstructor.path = VKWebSet.methodGetPhotoUser.rawValue
        urlConstructor.queryItems = [
                    URLQueryItem(name: "access_token", value: Session.instance.token),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "album_id", value: "saved"),
                    URLQueryItem(name: "owner_id", value: String(idUser))
                ]
        
        AF.request(urlConstructor.url!).response { response in
            debugPrint(response)
        }
    }
}
