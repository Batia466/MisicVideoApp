//
//  ViewController.swift
//  MusicVideo
//
//  Created by Ксения Митус on 03.05.16.
//  Copyright © 2016 Yury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        
       //Call API
        let api = APIManager()
        
        // 10.10.100.106:1234
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion:didLoadData)
    
    
    }

    func didLoadData(result:String) {
        print(result)
        
        
        let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok",style: .Default) {
            action -> Void in
            
        }
        
        alert.addAction(okAction)
        self.presentViewController(alert, animated:true, completion:nil)
    
    }


}

