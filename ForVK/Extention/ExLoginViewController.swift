//
//  ExViewController.swift
//  ForVK
//
//  Created by Илья Кадыров on 27.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation
import WebKit
import Alamofire

extension LoginFormController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
                  decisionHandler(.allow)
                  return
              }
              
              let params = fragment
                  .components(separatedBy: "&")
                  .map { $0.components(separatedBy: "=") }
                  .reduce([String: String]()) { result, param in
                      var dict = result
                      let key = param[0]
                      let value = param[1]
                      dict[key] = value
                      return dict
              }
            
            let session = Session.instance
            session.token = params["access_token"]!
            session.userId = Int(params["user_id"]!)!
            
            getAllFriend(idUser: session.userId)
            getPhotoUser(idUser: session.userId)
            getGroupUser(idUser: session.userId)
            searchGroup(text: "Star Wars")
            decisionHandler(.cancel)
    }
    
    func getAllFriend(idUser: Int) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKWebSet.scheme.rawValue
        urlConstructor.host = VKWebSet.host.rawValue
        urlConstructor.path = VKWebSet.methodGetAllFriend.rawValue
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "fields", value: "city,domain"),
                    URLQueryItem(name: "user_id", value: String(idUser)),
                ]
        
        AF.request(urlConstructor.url!).response { response in
            debugPrint(response)
        }
    }
    
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
    
    func getGroupUser(idUser: Int) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKWebSet.scheme.rawValue
        urlConstructor.host = VKWebSet.host.rawValue
        urlConstructor.path = VKWebSet.methodGetGroupUser.rawValue
        urlConstructor.queryItems = [
                    URLQueryItem(name: "access_token", value: Session.instance.token),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "extended", value: "1"),
                    URLQueryItem(name: "user_id", value: String(idUser))
                ]
        
        AF.request(urlConstructor.url!).response { response in
            debugPrint(response)
        }
    }
    
    func searchGroup(text: String) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKWebSet.scheme.rawValue
        urlConstructor.host = VKWebSet.host.rawValue
        urlConstructor.path = VKWebSet.methodSearchGroup.rawValue
        urlConstructor.queryItems = [
                    URLQueryItem(name: "access_token", value: Session.instance.token),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "q", value: text),
                    URLQueryItem(name: "type", value: "group"),
                ]
        
        AF.request(urlConstructor.url!).response { response in
            debugPrint(response)
        }
    }
}