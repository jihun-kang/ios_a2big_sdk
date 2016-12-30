//
//  FunSeasonData.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 12..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON
public  class FunSeasonData {
    public var season_no: String!
    public var season_name: String!
    public var media_no: String!
    public var character_no: String!
    public var season_ment: String!
    public var is_character:String!
   // public var is_ment:String!
    public var imageArr:[JSON]

    let baseUrl = "http://next-page.co.kr/web/junam/"
    required public init(json: JSON) {
        
        
        season_no = json["season_no"].stringValue
        season_name = json["season_name"].stringValue
        
        media_no = baseUrl+json["media_no"].stringValue.replacingOccurrences(of: "./", with: "")
        imageArr = json["image_list"].arrayValue

        character_no = json["character_no"].stringValue
        season_ment = json["season_ment"].stringValue
        
        
        is_character = json["is_character"].stringValue
  //      is_ment = json["is_ment"].stringValue

    }
}
