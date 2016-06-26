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
    private var _vRights:String
    private var _vPrice:String
    private var _vArtist:String
    private var _vImid:String
    private var _vLinkToiTunes:String
    private var _vGenre:String
    private var _vReleaseDte:String

    var vImageData:NSData?
    
    
    //Make a getter
    
    var vName:String {
        return _vName
    }
    var vRights:String {
        return _vRights
    }
    var vImageUrl:String {
        return _vImageUrl
    }
    var vVideoUrl:String {
        return _vVideoUrl
    }
    var vPrice:String {
        return _vPrice
    }
    
    var vArtist:String {
        return _vArtist
    }
    var vImid:String {
        return _vImid
    }
    var vLinkToiTunes:String {
        return _vLinkToiTunes
    }
    var vGenre:String {
        return _vGenre
    }
    var vReleaseDte:String{
        return _vReleaseDte
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
        
        // price
        if let price = data["im:price"] as? JSONDictionary,
            vPrice = price["label"] as? String {
            self._vPrice   = vPrice
        }
        else {
            _vPrice = ""
            
        }
        
        // artist
        if let artist = data["im:artist"] as? JSONDictionary,
            vArtist  = artist["label"] as? String {
            self._vArtist   = vArtist
        }
        else {
            _vArtist = ""
            
        }
        
        // rights
        if let rights = data["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String {
            self._vRights = vRights
        }
        else {
            _vRights = ""
            
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

        // release Date
        if let releaseDate = data["im:releaseDate"] as? JSONDictionary,
            vreleaseDateM = releaseDate["attributes"] as? JSONDictionary,
            vReleaseDte = vreleaseDateM["label"] as? String {
            _vReleaseDte = vReleaseDte
        }
        else {
            _vReleaseDte = ""
            
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
        
        // genre
        if let genreM = data["category"] as? JSONDictionary,
            vGenreM = genreM["attributes"] as? JSONDictionary,
             vGenre = vGenreM["term"] as? String {
            self._vGenre =  vGenre
        }
        else {
            _vGenre = ""
        }
        
        // ImID
        if let imidM = data["id"] as? JSONDictionary,
            vimidM = imidM["attributes"] as? JSONDictionary,
            vImid = vimidM["im:id"] as? String {
            self._vImid =  vImid
        }
        else {
            _vImid = ""
        }
        
        // LinkToItunes
        if let linkI = data["id"] as? JSONDictionary,
            vLinkToiTunes = linkI["label"] as? String {
            self._vLinkToiTunes =  vLinkToiTunes
        }
        else {
            _vLinkToiTunes = ""
        }

        
    }
    
    
}