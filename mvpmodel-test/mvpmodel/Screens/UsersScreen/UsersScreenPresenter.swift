//
//  UsersScreenPresenter.swift
//  mvpmodel
//
//  Created by iosdev on 9.4.2018.
//  Copyright © 2018 iosdev. All rights reserved.
//

import Foundation

protocol UsersScreenPresenterProtocol {
    
    func performGetUser()
}

class UsersScreenPresenter: UsersScreenPresenterProtocol {
    
    var view: UsersScreenViewProtocol?
    var userService: UserServiceProtocol = UserService()
    
    init(view: UsersScreenViewProtocol) {
        self.view = view
    }
    
    func performGetUser() {
        view?.showLoading()
        userService.getUsers(completion: { response in
            switch response {
            case .success(let response):
                self.view?.onGetUsersSuccess(userList: response)
                self.view?.hideLoading()
            case .error(let error):
                self.view?.onGetUserError(error: error.localizedDescription)
                self.view?.hideLoading() //put self here is not the right way
            }
        })
    }
    
    
}
