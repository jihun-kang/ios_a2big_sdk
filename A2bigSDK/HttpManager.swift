//
//  HttpManager.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 2..
//  Copyright © 2016년 a2big. All rights reserved.
//

import UIKit
//import SwiftyJSON

@objc public protocol JSONDelegate {
    func onFinish(result:String)
    func onFinishXML(result:Data)

}


public class HttpManager: NSObject {
    weak public var delegate: JSONDelegate? = nil  //notified when a selection occurs
    public static let sharedInstance = HttpManager()

    
    var imageArray = [String]()
    var json:JSON = []
    var count: Int = 0

    
    
    override init() {
        super.init()

        print ("init")
    }
    
   public  func getImageArray()->[String]{
        return imageArray
    }
    
//     (y1: CGFloat, y2: CGFloat)
    
    public func getVistCourse(){
        initJSON()
        delegate?.onFinish(result: "")

    }
 /*
    func getCurCorse(index:Int)->ViewCourseData{
        let  data = ViewCourseData()
        data.viewNo = self.json["view"][index]["view_no"].stringValue
        data.viewName = self.json["view"][index]["view_name"].stringValue
        data.imageNo = self.json["view"][index]["image_no"].stringValue
        data.viewMent = self.json["view"][index]["view_ment"].stringValue
        data.viewAddress = self.json["view"][index]["view_address"].stringValue
        data.viewPhone = self.json["view"][index]["view_phone"].stringValue
        return data
    }
   */
    
   public  func test(){

        do {
            //http://blog.naver.com/PostView.nhn?blogId=ufo7142&logNo=220716957884
            //http://meyerweb.com/eric/tools/dencoder/
            let api_key = "ssXNG8Mf3rydSEg7RYX4qrhPufujkFFgcZKiyYFa5%2Fwb7O5Az%2FvV%2B2uG5Tf0TkBN0eoR%2FAYj9WxBjpJG21UbeQ%3D%3D"
            let scriptUrl = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib"
            let parma1 = "&base_date=" + "20161109"
            let parma2 = "&base_time=" + "0600"
            let parma3 = "&nx=55" + "&ny=127"
            let urlWithParams = scriptUrl + "?ServiceKey=\(api_key)" + parma1 + parma2 + parma3
            
            print (urlWithParams)
            
            let opt = try HTTP.GET(urlWithParams)

                        opt.start { response in
                if let err = response.error {
                    print("error: \(err.localizedDescription)")
                    self.delegate?.onFinish(result: response.description)
                    
                    return //also notify app of failure as needed
                }
                print("opt finished: \(response.data)")
                self.delegate?.onFinishXML(result: response.data)
 
            }
        } catch let error {
            print("got an error creating the request: \(error)")
            delegate?.onFinish(result: "")
            
            
        }

    }
    
    /*
     기상청 격자정보 - 위경도 변환
     http://fronteer.kr/service/kmaxy
    */
    public func realTimeWeather(){
        do{
            let api_key = "ssXNG8Mf3rydSEg7RYX4qrhPufujkFFgcZKiyYFa5%2Fwb7O5Az%2FvV%2B2uG5Tf0TkBN0eoR%2FAYj9WxBjpJG21UbeQ%3D%3D"
            let scriptUrl = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib"
        
            let parma1 = "&base_date=" + "20161109"
            let parma2 = "&base_time=" + "0600"
            let parma3 = "&nx=60" + "&ny=127"
            let parma4 = "&pageNo=1&numOfRows=7";
            let parma5 = "&_type=json";
        
        
        
            let urlWithParams = scriptUrl + "?ServiceKey=\(api_key)" + parma1 + parma2 + parma3+parma4+parma5
            print (urlWithParams)
        
            let opt = try HTTP.GET(urlWithParams)
        
            opt.start { response in
                if let err = response.error {
                    print("error: \(err.localizedDescription)")
                    self.delegate?.onFinish(result: "")
                
                    return //also notify app of failure as needed
                }
                print("opt finished: \(response.description)")
                self.delegate?.onFinish(result: response.description)
            }
        } catch let error {
            print("got an error creating the request: \(error)")
            delegate?.onFinish(result: error as! String)
        }
    
    }

    /*
     관광정보
    */
   public  func initJSON(){
        
        do {
            let opt = try HTTP.GET("http://next-page.co.kr/web/junam/look_view_json.php")
            opt.start { response in
                if let err = response.error {
                    print("error: \(err.localizedDescription)")
                    self.delegate?.onFinish(result: "")
                    
                    return //also notify app of failure as needed
                }
                print("opt finished: \(response.description)")
                //print("data is: \(response.data)") access the response of the data with response.data
                
                // if response.data != nil {
                self.json = JSON(data: response.data)
                self.count = (self.json["view"].array?.count)!
                print("JH count: \(self.count)")
                print("JH: \(self.json)")
                
                for index in 0...self.count-1{
                    print("view_no:\(self.json["view"][index]["view_no"])")
                    print("view_name:\(self.json["view"][index]["view_name"])")
                    print("image_no:\(self.json["view"][index]["image_no"])")
                    print("view_ment:\(self.json["view"][index]["view_ment"])")
                    print("view_phone:\(self.json["view"][index]["view_address"])")
                    print("view_phone:\(self.json["view"][index]["view_phone"])")
                    let image = self.json["view"][index]["image_no"].stringValue.replacingOccurrences(of: "./", with: "")
                    print ( "{\(image)}")
                    self.imageArray.append(image)
                }
                
                
                self.delegate?.onFinish(result: "")
                
            }
        } catch let error {
            print("got an error creating the request: \(error)")
            delegate?.onFinish(result: "")

            
        }
        
        
    }

    
}

