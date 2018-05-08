//
//  UsersScreenVC.swift
//  mvpmodel
//
//  Created by iosdev on 9.4.2018.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit

protocol UsersScreenViewProtocol: class {
    
    func showLoading()
    
    func hideLoading()
    
    func onGetUserError(error: String)
    
    func onGetUsersSuccess(userList: [User])
}

class UsersScreenVC: UIViewController, UsersScreenViewProtocol {
    @IBOutlet weak var loadingLbl: UILabel!
    @IBOutlet weak var usersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         presenter = UsersScreenPresenter(view: self)
        // Do any additional setup after loading the view.
        presenter?.performGetUser()
    }
    
    var presenter: UsersScreenPresenter?
    func showLoading() {
        loadingLbl.text = "Loading...."
    }
    
    func hideLoading() {
        loadingLbl.text = ""
    }
    
    func onGetUserError(error: String) {
        usersLabel.text = error
    }
    
    func onGetUsersSuccess(userList: [User]) {
        //show it
        usersLabel.text = userList.description
        print(userList)
    }
    

    
}
