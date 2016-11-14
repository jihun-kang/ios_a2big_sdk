//
//  NoticeData.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 7..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON
public class NoticeData{
    public var notice_no: String!
    public var start_date: String!
    public var end_date: String!
    public var notice_title: String!
    public var notice_ment: String!
    public var flag: String!
    
    required public init(json: JSON) {
        notice_no = json["notice_no"].stringValue
        start_date = json["start_date"].stringValue
        end_date = json["end_date"].stringValue
        notice_title = json["notice_title"].stringValue
        notice_ment = json["notice_ment"].stringValue
        flag = json["flag"].stringValue
        
    }
    
}
