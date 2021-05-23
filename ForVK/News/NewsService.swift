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

    let dispatchGroup = DispatchGroup()
    var listNews:[News] = []
    var listGroup:[SourseData] = []
    var listProfile:[SourseData] = []
    
    func getNews(completion: @escaping ([News]) -> Void) {
       let urlNews = self.getUrlNews()
        AF.request(urlNews!).responseJSON { [weak self] response in
            guard let data = response.data else { return }
            self?.parsing(data: data, completion: completion)
            
        }
    }
    
    private func parsing(data: Data,completion: @escaping ([News]) -> Void)  {
        self.parsingNews(data: data)
        self.parsingGroups(data: data)
        self.parsingProfiles(data: data)
        
        
        dispatchGroup.notify(queue: .main) {
            self.setSourse()
            completion(self.listNews)
        }
        
    }
    
    private func setSourse() {
        for news in self.listNews {
            if news.sourseId < 0 {
                for group in self.listGroup {
                    if group.id == (news.sourseId * -1) {
                        news.sourseData = group
                        break
                    }
                }
            } else {
                for user in self.listProfile{
                    if user.id == news.sourseId {
                        news.sourseData = user
                        break
                    }
                }
            }
        }
    }
    private func parsingNews(data: Data) {
        dispatchGroup.enter()
        let items = JSON(data)["response"]["items"]
       
        for news:JSON in items.arrayValue {
            guard let type = news["type"].string else {continue}
            if type == "post" {
                self.listNews.append(PostNews(newsJson: news))
                }
            if type == "photo" {
                self.listNews.append(PhotoNews(newsJson: news))
                }
            if type == "wall_photo" {
                self.listNews.append(PhotoNews(newsJson: news))
                }
            
        }
        dispatchGroup.leave()
    }
    
    private func parsingGroups(data: Data){
        dispatchGroup.enter()
        let groups = JSON(data)["response"]["groups"]
        
        for group:JSON in groups.arrayValue {
            self.listGroup.append(SourseData(groupJson: group))
        }
        dispatchGroup.leave()
    }
    
    private func parsingProfiles(data: Data){
        dispatchGroup.enter()
        let profiles = JSON(data)["response"]["profiles"]
        for user:JSON in profiles.arrayValue {
            self.listProfile.append(SourseData(userJson: user))
        }
        dispatchGroup.leave()
    }
    
    func getUrlNews() -> URL? {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKSet.scheme.rawValue
        urlConstructor.host = VKSet.host.rawValue
        urlConstructor.path = VKSet.methodGetNews.rawValue
        urlConstructor.queryItems = [
                    URLQueryItem(name: "access_token", value: Session.instance.token),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "filters", value: "post, photo, wall_photo"),
            URLQueryItem(name: "source_ids", value: "groups, friends")
                ]
        return urlConstructor.url
    }
}
