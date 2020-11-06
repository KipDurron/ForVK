//
//  NewsService.swift
//  ForVK
//
//  Created by Илья Кадыров on 04.11.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Alamofire
import SwiftyJSON

class NewsService {

    func getNews() {
       
       let urlNews = self.getUrlNews()
        AF.request(urlNews!).responseJSON { response in
            guard let data = response.value else { return }
            let items = JSON(data)["response"]["items"]
            let groups = JSON(data)["response"]["groups"]
            let profiles = JSON(data)["response"]["profiles"]
            for (index,news):(String, JSON) in items {
                guard let post_type = news["post_type"].string else {break}
                if post_type == "post" {
                    self.getPostNews(news: news, groups: groups, profiles: profiles)
                }
                if post_type == "photo" {
                    self.getPhotoNews()
                }
            }
            
        }
    }
    
    private func getPhotoNews() {
        
    }
    
    private func getPostNews(news: JSON, groups: JSON, profiles: JSON) {
        
        guard let sourseId = news["source_id"].int else { return }
        if sourseId < 0 {
            self.setGroupData(groups: groups, idGroup:sourseId * -1)
        } else {
            self.setUserData(profiles: profiles, idProfile: sourseId)
        }
        
    }
    
    private func setGroupData(groups: JSON, idGroup: Int) -> User? {
//        for (index, group):(String, JSON) in groups {
//            guard let currentId = group[""].int else { continue }
//            if currentId == idGroup {
//                return User(jsonSource: group)
//            }
//        }
        return nil
    }
    
    private func setUserData(profiles: JSON, idProfile: Int) {
        
    }
    
    func getUrlNews() -> URL? {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKSet.scheme.rawValue
        urlConstructor.host = VKSet.host.rawValue
        urlConstructor.path = VKSet.methodGetNews.rawValue
        urlConstructor.queryItems = [
                    URLQueryItem(name: "access_token", value: Session.instance.token),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "filters", value: "post, photo"),
            URLQueryItem(name: "source_ids", value: "groups, friends")
                ]
        return urlConstructor.url
    }
}
