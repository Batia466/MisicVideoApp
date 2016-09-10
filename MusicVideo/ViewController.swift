//
//  ViewController.swift
//  MusicVideo
//
//  Created by Ксения Митус on 03.05.16.
//  Copyright © 2016 Yury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var videos = [Videos]()

    override func viewDidLoad() {
        super.viewDidLoad()
   
        
       //Call API
        let api = APIManager()
        
        // 10.10.100.106:1234
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion:didLoadData)
    
    
    }

    func didLoadData(videos:[Videos]) {
        
        for item in videos {
        
            print("name = \(item.vName)")
        }
        
    }


}

