//
//  LookViewData.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 7..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON
public class LookViewData{
    public var view_no: String!
    public var view_name: String!
    public var image_no: String!
    public var view_ment: String!
    public var view_address: String!
    public var view_phone: String!
    
    required public init(json: JSON) {
        view_no = json["view_no"].stringValue
        view_name = json["view_name"].stringValue
        image_no = json["image_no"].stringValue
        view_ment = json["view_ment"].stringValue
        view_address = json["view_address"].stringValue
        view_phone = json["view_phone"].stringValue
        
    }
    
}
