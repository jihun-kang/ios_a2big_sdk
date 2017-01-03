//
//  ViewCourseData.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 2..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON
public  class ViewCourseData{
   public  var viewNo:String!
   public  var viewName:String!
   public var media_no: String!
   public var imageArr:[JSON]
   public  var viewMent:String!
   public  var viewAddress:String!
   public  var viewPhone:String!
   public  var flag:String!


    required public init(json: JSON, baseUrl:String) {
       // let image = baseUrl+json["image_no"].stringValue.replacingOccurrences(of: "./", with: "")
        

        viewNo = json["view_no"].stringValue
        viewName = json["view_name"].stringValue
        media_no = baseUrl+json["media_no"].stringValue.replacingOccurrences(of: "./", with: "")
        
        imageArr = json["image_list"].arrayValue

        viewMent = json["view_ment"].stringValue
        viewAddress = json["view_address"].stringValue
        viewPhone = json["view_phone"].stringValue
        
        flag = json["flag"].stringValue

    }
    
}
