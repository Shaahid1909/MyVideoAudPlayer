//
//  Video.swift
//  MyVideoPlayer
//
//  Created by Admin on 29/12/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct Video {
    
    let authorName: String
    let videoFileName: String
    let description: String
    let thumbnailFileName: String
    
    
    static func fetchVideos() -> [Video] {
        let v1 = Video(authorName: "AirpodsMax", videoFileName: "v3", description: "This is demo video", thumbnailFileName: "v3.jpg")
        
        let v2 = Video(authorName: "Macapp", videoFileName: "v1", description: "This is demo video", thumbnailFileName: "v1.jpg")
        
        let v3 = Video(authorName: "Tesla", videoFileName: "v2", description: "This is demo video", thumbnailFileName: "v2.jpg")
        
         let v4 = Video(authorName: "2021", videoFileName: "v4", description: "This is demo video", thumbnailFileName: "v4.jpg")
        
        
        return [v1, v2, v3, v4]
    }
    
}






























