//
//  PopUpData.swift
//  A2bigSDK
//
//  Created by a2big on 2016. 12. 2..
//  Copyright © 2016년 a2big. All rights reserved.
//

import Foundation
public class PopUpData {
    public var popup_no: String!
    public var top_name: String!
    public var popup_name: String!
    public var media_no: String!
    public var imageArr:[JSON]
    public var popup_ment: String!
    public var popup_address: String!
    public var popup_phone: String!
    public var flag: String!
    
    
    
    let baseUrl = "http://next-page.co.kr/web/junam/"
    required public init(json: JSON) {
        popup_no = json["popup_no"].stringValue
        top_name = json["top_name"].stringValue
        popup_name = json["popup_name"].stringValue
        media_no = baseUrl+json["media_no"].stringValue.replacingOccurrences(of: "./", with: "")
        imageArr = json["image_list"].arrayValue
        popup_ment = json["popup_ment"].stringValue
        popup_address = json["popup_address"].stringValue
        popup_phone = json["popup_phone"].stringValue
        flag = json["flag"].stringValue
        
    }
}
