//
//  ArroundData.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 2..
//  Copyright © 2016년 a2big. All rights reserved.
//


//import SwiftyJSON
public class ArroundData {
    public var no: String!
    public var name: String!
    public var image_no: String!
    public var ment: String!
    public var category: String!
    public var lat: String!
    public var lon: String!
    public var address: String!

    let baseUrl = "http://next-page.co.kr/web/junam/"
    required public init(json: JSON) {
        let image = baseUrl+json["image_no"].stringValue.replacingOccurrences(of: "./", with: "")

        
        no = json["surroundings_no"].stringValue
        name = json["surroundings_name"].stringValue
        image_no = image
        ment = json["surroundings_ment"].stringValue
        category = json["surroundings_category"].stringValue
        lat = json["lat"].stringValue
        lon = json["lon"].stringValue
        
        address = json["surroundings_address"].stringValue

    }
}
