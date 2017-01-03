//
//  MainMenuData.swift
//  A2bigSDK
//
//  Created by a2big on 2016. 11. 25..
//  Copyright © 2016년 a2big. All rights reserved.
//

import Foundation
public class MainMenuData {
    public var main_no: String!
    public var main_version: String!
    public var create_date: String!
    public var imageArr:[JSON]
    
    required public init(json: JSON, baseUrl:String)  {
        main_no = json["main_no"].stringValue
        main_version = json["main_version"].stringValue
        imageArr = json["image_list"].arrayValue
        create_date = json["create_date"].stringValue
        
    }
}
