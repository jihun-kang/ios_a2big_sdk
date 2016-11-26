//
//  LookBeaconData.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 7..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON
/*
 is_popup (1:일반관람,2:테마관람)
 type (view_no : 일반관람
       info_no : 생태가이드 > 가이드 등록,
       season_no : Fun한 주남 > 사계 여행, 
       time_no : Fun한 주남 > 시간 여행,
       story_no: Fun한 주남 > 스토리 여행,)
 sub_type (고유번호)
 */
public class LookBeaconData {
    public var uuid: String!
    public var major: String!
    public var minor: String!
    public var beacons_address: String!
    public var is_popup: String!
    public var type: String!
    public var sub_type: String!
    public var is_photo: String!
    public var is_stamp: String!

    
    required public init(json: JSON) {
        
        uuid = json["uuid"].stringValue
        major = json["major"].stringValue
        minor = json["minor"].stringValue
        beacons_address = json["beacons_address"].stringValue
        is_popup = json["is_popup"].stringValue
        type = json["type"].stringValue
        sub_type = json["sub_type"].stringValue
        is_photo = json["is_photo"].stringValue
        is_stamp = json["is_stamp"].stringValue

    }
}
