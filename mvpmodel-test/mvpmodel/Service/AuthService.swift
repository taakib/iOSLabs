//
//  AuthService.swift
//  mvpmodel
//
//  Created by iosdev on 5.4.2018.
//  Copyright © 2018 iosdev. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthServiceProtocol {
    
    func login(username: String, password: String,  completion: @escaping (ServerResponse<Any>) -> Void)
    
    func register(username: String, password: String,  completion: @escaping (ServerResponse<Any>) -> Void)
}

class AuthService: AuthServiceProtocol {
    func login(username: String, password: String, completion: @escaping (ServerResponse<Any>) -> Void) {
        let parameters: Parameters = ["username": username, "password": password]
        Alamofire.request(
            URL(string: "https://ngblogapi.herokuapp.com/auth/signin")!,
            method: .post,
            parameters: parameters)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    print(response)
                    let jsonDecoder = JSONDecoder()
                    do {
                        let authResponse = try jsonDecoder.decode(AuthResponse.self, from: response.data!)
                        completion(ServerResponse.success(authResponse.token)) //send the token
                    } catch {
                      // catch errors here
                        completion(ServerResponse.error(error: error))
                    }
                    
                case .failure(let error):
                    completion(ServerResponse.error(error: error))
                    print("failure")
                }
        }
        
    }
    
    
    func register(username: String, password: String, completion: @escaping (ServerResponse<Any>) -> Void) {
        let parameters: Parameters = ["username": username, "password": password]
        Alamofire.request(
            URL(string: "https://ngblogapi.herokuapp.com/api/users")!,
            method: .post,
            parameters: parameters)
            .validate()
            .responseJSON { response in
                switch response.result {
                    case .success:
                        print("success")
                        completion(ServerResponse.success("Register success")) //can put object or anything, forexample: String
                    case .failure(let error):
                        completion(ServerResponse.error(error: error))
                        print("failure")
                }
            }
    }
}
