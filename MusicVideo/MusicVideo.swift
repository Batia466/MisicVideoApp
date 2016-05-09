//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Ксения Митус on 09.05.16.
//  Copyright © 2016 Yury. All rights reserved.
//

import Foundation

class Videos {
    // Data encapsulation
    
    private var _vName:String
    private var _vImageUrl:String
    private var _vVideoUrl:String
    
    
    //Make a getter
    
    var vName:String {
        return _vName
    }
    var vImageUrl:String {
        return _vImageUrl
    }
    var vVideoUrl:String {
        return _vVideoUrl
    }
    init(data:JSONDictionary) {
    
        // Video name
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
                self._vName = vName
        }
        else {
            _vName = ""
        
        }
        
        // Video image
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            imimage = image["label"] as? String {
                _vImageUrl =  imimage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else {
            _vImageUrl = ""
            
        }

        // Video url
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["label"] as? String {
                self._vVideoUrl =  vVideoUrl
        }
        else {
            _vVideoUrl = ""
        }
    }
    
    
}