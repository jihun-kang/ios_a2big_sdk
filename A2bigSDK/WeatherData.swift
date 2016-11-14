//
//  WeatherData.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 9..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON
public class WeatherData {
    public var baseDate: String!
    public var baseTime: String!
    public var category: String!
    public var nx: String!
    public var ny: String!
    public var obsrValue: String!

    required public init(json: JSON) {
        
        baseDate = json["baseDate"].stringValue
        baseTime = json["baseTime"].stringValue
        category = json["category"].stringValue
        nx = json["nx"].stringValue
        ny = json["ny"].stringValue
        obsrValue = json["obsrValue"].stringValue
    }
}
