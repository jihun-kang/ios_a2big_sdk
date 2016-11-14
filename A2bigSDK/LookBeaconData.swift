//
//  LookBeaconData.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 7..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON
public class LookBeaconData {
    public var uuid: String!
    public var major: String!
    public var minor: String!
    public var beacons_address: String!
    public var lat: String!
    public var lon: String!
    public var view_no: String!
    
    required public init(json: JSON) {
        
        uuid = json["uuid"].stringValue
        major = json["major"].stringValue
        minor = json["minor"].stringValue
        beacons_address = json["beacons_address"].stringValue
        lat = json["lat"].stringValue
        lon = json["lon"].stringValue
        view_no = json["view_no"].stringValue

    }
}
