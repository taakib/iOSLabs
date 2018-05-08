//
//  ServerResponse.swift
//  mvpmodel
//
//  Created by iosdev on 5.4.2018.
//  Copyright © 2018 iosdev. All rights reserved.
//

import Foundation

enum ServerResponse<T> {
    case success(T)
    case error(error: Error)
}



//get user by id
//server -> json user {"username":"huy", age: 20}
// create a User.class -> this is the model user
//map the response to User.class
//let user = User(....)

//you need a way to parse Json to object
