//
//  LoginService.swift
//  ForVK
//
//  Created by Илья Кадыров on 28.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import Foundation

class LoginService {
    func authVKRequest() -> URLRequest {
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "oauth.vk.com"
                urlComponents.path = "/authorize"
                urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: AuthSetting.clientId.rawValue),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "262150"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "v", value: "5.68")
                ]
        return URLRequest(url: urlComponents.url!)
    }
}
