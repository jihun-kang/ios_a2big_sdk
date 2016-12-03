//
//  QuizData.swift
//  A2bigSDK
//
//  Created by a2big on 2016. 12. 3..
//  Copyright © 2016년 a2big. All rights reserved.
//

import Foundation
public class QuizData {
    public var quiz_no: String!
    public var quiz_name: String!
    public var image_no: String!

    public var quiz_exmaple1: String!
    public var quiz_exmaple2: String!
    public var quiz_exmaple3: String!
    public var quiz_exmaple4: String!
    public var quiz_exmaple5: String!
    public var quiz_exmaple6: String!
    public var quiz_exmaple7: String!
    
    public var imageArr:[JSON]
    
    public var quiz_select: String!
    public var quiz_flag: String!
    
    
    let baseUrl = "http://next-page.co.kr/web/junam/"
    required public init(json: JSON) {
        quiz_no = json["quiz_no"].stringValue
        quiz_name = json["quiz_name"].stringValue
        image_no = baseUrl+json["image_no"].stringValue.replacingOccurrences(of: "./", with: "")
        quiz_exmaple1 = json["quiz_exmaple1"].stringValue
        quiz_exmaple2 = json["quiz_exmaple2"].stringValue
        quiz_exmaple3 = json["quiz_exmaple3"].stringValue
        quiz_exmaple4 = json["quiz_exmaple4"].stringValue
        quiz_exmaple5 = json["quiz_exmaple5"].stringValue
        quiz_exmaple6 = json["quiz_exmaple6"].stringValue
        quiz_exmaple7 = json["quiz_exmaple7"].stringValue
        imageArr = json["image_list"].arrayValue
        quiz_select = json["quiz_select"].stringValue
        quiz_flag = json["quiz_flag"].stringValue
    }
}
