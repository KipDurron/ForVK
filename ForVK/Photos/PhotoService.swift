//
//  PhotoService.swift
//  ForVK
//
//  Created by Илья Кадыров on 28.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//
import Alamofire

class PhotoService {
    
    func getAllphotoUser(idUser: Int, completion: @escaping ([String]) -> Void) {
        
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
        
        AF.request(urlConstructor.url!).responseJSON { response in
            guard let data = response.value else { return }
            let items = VKParsingHelper.getItems(data: data)
            completion(self.parsingPhotosUser(items: items))
        }
    }
    
    func parsingPhotosUser(items: [[String: Any]]) -> [String] {
        
        var photoUrlArr: [String] = []
        items.forEach({ item in
            let sizes = item["sizes"] as! [[String: Any]]
            for size in sizes {
                if size["type"] as! String == "q" {
                    let urlStr = size["url"] as? String
                    if urlStr != nil {
                        photoUrlArr.append(urlStr!)
                    }
                    break
                }
            }
        })
        return photoUrlArr
    }
    
}
