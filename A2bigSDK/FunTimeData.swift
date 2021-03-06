//
//  FunTimeData.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 12..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON
public class FunTimeData {
    public var time_no: String!
    public var time_name: String!
    public var media_no: String!
    public var character_no: String!
    public var time_ment: String!
    public var is_character:String!
   // public var is_ment:String!
    public var imageArr:[JSON]

    required public init(json: JSON, baseUrl:String)  {
        time_no = json["time_no"].stringValue
        time_name = json["time_name"].stringValue
        media_no = baseUrl+json["media_no"].stringValue.replacingOccurrences(of: "./", with: "")
        imageArr = json["image_list"].arrayValue
        character_no = json["character_no"].stringValue
        time_ment = json["time_ment"].stringValue
        
        is_character = json["is_character"].stringValue
    //    is_ment = json["is_ment"].stringValue
        

    }
}
