//
//  ViewController.swift
//  Lab5
//
//  Created by iosdev on 22.3.2018.
//  Copyright © 2018 ilkka miettinen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //our label test
    @IBOutlet weak var labelTest: UILabel!
    
    //the json file url
    let URL_HEROES = "http://localhost:8080/ANIME/webresources/myendpoint";
    
    //A string array to save all the names
    var nameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //calling the function that will fetch the json
        getJsonFromUrl();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //this function is fetching the json from URL
    func getJsonFromUrl(){
        //creating a NSURL
        let url = NSURL(string: URL_HEROES)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //printing the json in console
                print(jsonObj!.value(forKey: "members")!)
                
                //getting the avengers tag array from json and converting it to NSArray
                if let heroeArray = jsonObj!.value(forKey: "members") as? NSArray {
                    //looping through all the elements
                    for heroe in heroeArray{
                        
                        //converting the element to a dictionary
                        if let heroeDict = heroe as? NSDictionary {
                            
                            //getting the name from the dictionary
                            if let name = heroeDict.value(forKey: "name") {
                                
                                //adding the name to the array
                                self.nameArray.append((name as? String)!)
                            }}
                    }
                }
                
                OperationQueue.main.addOperation({
                    //calling another function after fetching the json
                    //it will show the names to label
                    self.showNames()
                })
            }
        }).resume()
    }
    
    func showNames(){
        //looing through all the elements of the array
        for name in nameArray{
            
            //appending the names to label
            labelTest.text = labelTest.text! + name + "\n";
        }
    }
    

}

