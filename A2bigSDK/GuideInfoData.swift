//
//  GuideInfoData.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 12..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON
public class GuideInfoData {
    public var info_no: String!
    public var info_name: String!
    public var media_no: String!
    public var imageArr:[JSON]
    public var character_no: String!
    public var info_ment: String!
    public var flag_name: String!
    public var season_flag_name: String!
    
    public var is_character: String!
    public var is_ment: String!

    
    let baseUrl = "http://next-page.co.kr/web/junam/"
    required public  init(json: JSON) {
        info_no = json["info_no"].stringValue
        info_name = json["info_name"].stringValue
        media_no = baseUrl+json["media_no"].stringValue.replacingOccurrences(of: "./", with: "")
        imageArr = json["image_list"].arrayValue
        character_no = json["character_no"].stringValue
        info_ment = json["info_ment"].stringValue
        flag_name = json["flag_name"].stringValue
        season_flag_name = json["season_flag_name"].stringValue
        
        is_character = json["is_character"].stringValue
        is_ment      = json["is_ment"].stringValue

    }
}
