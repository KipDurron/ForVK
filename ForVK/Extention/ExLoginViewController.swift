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
              
              let token = params["access_token"]
            
            print(token)
            getAllFriend(token: token)
            decisionHandler(.cancel)
    }
    
    func getAllFriend(token: String?) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = VKWebSet.scheme.rawValue
        urlConstructor.host = VKWebSet.host.rawValue
        urlConstructor.path = VKWebSet.methodAllFriend.rawValue
        urlConstructor.queryItems = [
                    URLQueryItem(name: "access_token", value: token!),
                    URLQueryItem(name: "v", value: "5.124"),
                    URLQueryItem(name: "fields", value: "city,domain"),
                ]
        AF.request(urlConstructor.url!).response { response in
            debugPrint(response)
        }


    }
}
