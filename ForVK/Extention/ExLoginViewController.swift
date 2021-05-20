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
            session.userId = String(params["user_id"]!)
            
            decisionHandler(.cancel)
        
//            performSegue(withIdentifier: "successLogin", sender: self)
        let tabBarController = createTabController()
        tabBarController.modalPresentationStyle = .fullScreen 
        self.present(tabBarController, animated: true, completion: nil)
      
        

    }
    
    func createTabController() -> UITabBarController{
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = setupControllers()
        
        return tabBarController
    }
    
    func setupControllers() -> [UINavigationController] {
        return [
            createNavController(for: FriendsController(), title: "Друзья", image: UIImage.init(systemName: "person")!)
        ]
    }
    
    func createNavController(for rootController: UIViewController,
                             title: String,
                             image: UIImage) -> UINavigationController{
        
        let navController = UINavigationController(rootViewController: rootController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
//        navController.navigationBar.prefersLargeTitles = true
        rootController.navigationItem.title = title
        return navController
        
    }
}
