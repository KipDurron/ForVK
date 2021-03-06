//
//  LoginFormController.swift
//  ForVK
//
//  Created by Илья Кадыров on 16.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit
import WebKit

class LoginFormController: UIViewController {
    
    var loginService = LoginService()

    @IBOutlet weak var webview: WKWebView! {
        didSet{
            webview.navigationDelegate = self
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    

    @IBOutlet weak var loginInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    func checkUserData() -> Bool{
        guard let login = self.loginInput.text, let password = self.passwordInput.text else {
            return false
        }
        if login == "admin" && password == "admin" {
            return true
        } else {
            return false
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard checkUserData() else {
            showLoginError()
            return false
        }
        return true
    }

    func showLoginError() {
        // Создаем контроллер
        let alert = UIAlertController(title: "Ошибка", message: "Введены не верные данные(верные: admin, admin)", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alert.addAction(action)
        // Показываем UIAlertController
        present(alert, animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
     }
     
     @objc func keyboardWillHide(notification: Notification) {
        self.scrollView.contentInset = .zero
     }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }

    func startWebView() {
        webview.load(loginService.authVKRequest())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//         Do any additional setup after loading the view.
         //Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        self.scrollView?.addGestureRecognizer(hideKeyboardGesture)
        self.loginInput.text = "admin"
        self.passwordInput.text = "admin"
        
        startWebView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


