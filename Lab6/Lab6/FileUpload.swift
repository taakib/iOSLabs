//
//  FileUpload.swift
//  LabThings
//
//  Created by iosdev on 6.4.2018.
//  Copyright © 2018 ilkka miettinen. All rights reserved.
//

import Foundation
import UIKit

class UploadImg  {
    
    func sendIMG(image: UIImage) {
        
        let url = URL(string: "http://localhost:8080/Period4Project/webresources/PostFile")
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("text/plain", forHTTPHeaderField: "Accept")
        
        let imgData = UIImagePNGRepresentation(image)
        
        let encodedImg = imgData?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: NSData.Base64EncodingOptions.RawValue(0)))
        
        let jsonContent = ["imageType": "PNG", "encodedImage": encodedImg!]
        
        try? request.httpBody = JSONSerialization.data(withJSONObject: jsonContent, options: JSONSerialization.WritingOptions(rawValue: 0))
        
        //var backToString = String(data: request.httpBody!, encoding: String.Encoding.utf8) as String!
        //print(backToString!)
        
        let task = URLSession.shared.uploadTask(with: request, from: request.httpBody!) { data, response, error in
            if let error = error {
                print ("error: \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print ("response error \(response.statusCode)")
            }
            
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                    print ("server error")
                    return
            }
            
            if let data = data,
                let dataString = String(data: data, encoding: .utf8) {
                print ("got data: \(dataString)")
            }
        }
        task.resume()
        
    }
}
