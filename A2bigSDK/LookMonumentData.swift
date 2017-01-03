//
//  LookMonument.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 12..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON
public class LookMonumentData {
    public var monument_no: String!
    public var monument_name: String!
    public var media_no: String!
    public var character_no: String!
    public var monument_ment: String!
    public var imageArr:[JSON]
    
    required public init(json: JSON, baseUrl:String) {
        monument_no = json["monument_no"].stringValue
        monument_name = json["monument_name"].stringValue
        media_no = baseUrl+json["media_no"].stringValue.replacingOccurrences(of: "./", with: "")
        character_no = json["character_no"].stringValue
        monument_ment = json["monument_ment"].stringValue
        imageArr = json["image_list"].arrayValue
        
        ///name = json["image_list"].arrayObject
    }
}
