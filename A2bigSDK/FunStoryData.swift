//
//  FunStoryData.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 12..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON
public class FunStoryData {
    public var story_no: String!
    public var story_name: String!
    public var media_no: String!
    public var voice_no: String!

    let baseUrl = "http://next-page.co.kr/web/junam/"
    required public init(json: JSON) {
        story_no = json["story_no"].stringValue
        story_name = json["story_name"].stringValue
        media_no = baseUrl+json["media_no"].stringValue.replacingOccurrences(of: "./", with: "")
        voice_no = baseUrl+json["voice_no"].stringValue.replacingOccurrences(of: "./", with: "")
        
    }
}
