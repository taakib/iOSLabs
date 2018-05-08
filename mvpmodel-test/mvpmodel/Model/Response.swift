//
//  Response.swift
//  mvpmodel
//
//  Created by iosdev on 9.4.2018.
//  Copyright © 2018 iosdev. All rights reserved.
//

import Foundation

//Successs struct
struct SuccessResponse<T: Codable>: Codable {
    var status: Int
    var data: T
}

//Error struct
struct ErrorResponse<T: Codable>: Codable {
    var status: Int
    var description: T
}
