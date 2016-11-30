//
//  BeaconData.swift
//  A2bigSDK
//
//  Created by a2big on 2016. 11. 30..
//  Copyright © 2016년 a2big. All rights reserved.
//

import Foundation
public class BeaconData {
    public var uuid: String!
    public var major: String!
    public var minor: String!
    public var beacons_address: String!
    public var is_popup: String!
    public var type: String!
    public var sub_type: String!
    public var is_photo: String!
    public var is_stamp: String!

    
    
    let baseUrl = "http://next-page.co.kr/web/junam/"
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
