//
//  UserService.swift
//  mvpmodel
//
//  Created by iosdev on 9.4.2018.
//  Copyright © 2018 iosdev. All rights reserved.
//

import Foundation
import Alamofire

protocol UserServiceProtocol {
    
    func getUsers(completion: @escaping (ServerResponse<[User]>) -> Void)
}

class UserService: UserServiceProtocol {
    
    func getUsers(completion: @escaping (ServerResponse<[User]>) -> Void) {
        Alamofire.request(
            URL(string: "https://ngblogapi.herokuapp.com/api/users")!,
            method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    let jsonDecoder = JSONDecoder()
                    do {
                        print(response)
                        let response = try jsonDecoder.decode(SuccessResponse<[User]>.self, from: response.data!)
                        let userList = response.data
                        print("USER_LIST: \(userList)")
                        completion(ServerResponse.success(userList))
                    } catch (let error) {
                        print("ERROR: \(error)")
                        //completion(ServerResponse.error(error: <#T##Error#>))
                    }
                case .failure(let error):
                    completion(ServerResponse.error(error: error))
                    print("error: \(error)")
                }
        }
    }
}
