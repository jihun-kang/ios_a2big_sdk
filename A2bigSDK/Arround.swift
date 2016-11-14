//
//  Arround.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 7..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON
public class Arround {
    public var no: String!
    public var name: String!
    public var image_no: String!
    public var ment: String!
    public var category: String!
    public var lat: String!
    public var lon: String!
    required public init(json: JSON) {
        
        no = json["surroundings_no"].stringValue
        name = json["surroundings_name"].stringValue
        ment = json["surroundings_ment"].stringValue
        category = json["surroundings_category"].stringValue
        lat = json["lat"].stringValue
        lon = json["lon"].stringValue
    }
}
