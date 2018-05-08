//
//  AuthVC.swift
//  mvpmodel
//
//  Created by iosdev on 5.4.2018.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit

protocol AuthViewProtocol: class {
    
    func showLoading()
    
    func hideLoading()
    
    func onShowError(error: String)
    
    func onSuccess()
}

class AuthVC: UIViewController, AuthViewProtocol {
    var presenter: AuthPresenterProtocol?
   
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var authStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AuthPresenter(view: self)
        // Do any additional setup after loading the view.
    }
    
    func showLoading() {
        print("loading ....")
    }
    
    func hideLoading() {
        print("hide loading ....")
    }
    
    func onShowError(error: String) {
        print("we have an error: ", error)
        authStatus.text = error
    }
    
    func onSuccess() {
        print("successfully")
        authStatus.text = "Successfully"
    }
    

    @IBAction func loginWasPressed(_ sender: Any) {
        let username = userNameTextField.text ?? ""
        let password = passTextField.text ?? ""
        presenter?.performLogin(userName: username, password: password)
    }
    
    @IBAction func registerWasPressed(_ sender: Any) {
        let username = userNameTextField.text ?? ""
        let password = passTextField.text ?? ""
        presenter?.performRegister(userName: username, password: password)
    }
}
