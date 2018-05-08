//
//  AuthPresenter.swift
//  mvpmodel
//
//  Created by iosdev on 5.4.2018.
//  Copyright © 2018 iosdev. All rights reserved.
//

import Foundation

//LOGIC
protocol AuthPresenterProtocol {
    
    func performLogin(userName: String, password: String)
    
    func performRegister(userName: String, password: String)
    
}

class AuthPresenter: AuthPresenterProtocol {
    var view: AuthViewProtocol? //remember we need weak to prevent memory leak
    var authService: AuthServiceProtocol = AuthService()
    
    //constructor in Java
    init(view: AuthViewProtocol) {
        self.view = view
    }
    
    func performLogin(userName: String, password: String) {
        view?.showLoading()
        
        if userName.isEmpty || password.isEmpty {
            view?.onShowError(error: "Field should not be empty")
            view?.hideLoading()
        } else {
            //perform login here
            authService.login(username: userName, password: password, completion: {  response in
                switch response {
                case .success(let response):
                    //do sth with the response
                    //Save the token in defaultUsers
                    print("This is the response: \(response)")
                    self.view?.onSuccess()
                    self.view?.hideLoading()
                case .error(let error):
                    print(error)
                    self.view?.onShowError(error: error.localizedDescription)
                    self.view?.hideLoading() //put self here is not the right way
                }
            })
        }
       
    }
    
    func performRegister(userName: String, password: String) {
        view?.showLoading()
        
        if userName.isEmpty || password.isEmpty {
            view?.onShowError(error: "Field should not be empty")
            view?.hideLoading()
        } else {
            print("register with \(userName) and \(password)")
            view?.hideLoading()
            view?.onSuccess()
        }
        
       
    }
    
    //View <---> Presenter: preformLogin <----> Service
    
    
}
