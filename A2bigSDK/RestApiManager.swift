//
//  RestApiManager.swift
//  nextpage
//
//  Created by a2big on 2016. 11. 2..
//  Copyright © 2016년 a2big. All rights reserved.
//

//import SwiftyJSON

typealias ServiceResponse = (JSON, NSError?) -> Void

public class RestApiManager: NSObject {
    public static let sharedInstance = RestApiManager()
   
    let baseURL = "http://next-page.co.kr/web/junam/"
    
    
    //let baseURL = "http://next-page.co.kr/web/junam/look_surroundings_json.php"
    //  let baseURL = "http://www.a2big.com/test/json_test.php"
    
    public func getCurTimeHour()->(date:String, hour:String){
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)

        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        print("hours = \(hour):\(minutes):\(seconds)")
        let aStr = String(format: "%02d", hour-1)

        let dStr = String(format: "%02d%02d%02d", year,month,day)

        return (dStr,aStr)
    }

    // It gets Weather Infomation Using API
    public func realTimeWeather(onCompletion: @escaping (JSON) -> Void) {
        let current = getCurTimeHour()
        let api_key = "ssXNG8Mf3rydSEg7RYX4qrhPufujkFFgcZKiyYFa5%2Fwb7O5Az%2FvV%2B2uG5Tf0TkBN0eoR%2FAYj9WxBjpJG21UbeQ%3D%3D"
        let scriptUrl = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib"
        let parma1 = "&base_date=" + current.date
        let parma2 = "&base_time=" + current.hour + "00"
        let parma3 = "&nx=60" + "&ny=127"
        let parma4 = "&pageNo=1&numOfRows=7";
        let parma5 = "&_type=json";
        let route = scriptUrl + "?ServiceKey=\(api_key)" + parma1 + parma2 + parma3+parma4+parma5
        print (route)
        
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    //수신한 비콘정보로 서버에 요청
    public func requestBeaconInfo(uuid: String, major: String, minor:String ,onCompletion: @escaping (JSON) -> Void) {
        let route = "http://next-page.co.kr/web/junam/look_view_json.php"
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    //주변정보
    public func getArround(onCompletion: @escaping (JSON) -> Void) {
        let route = "http://next-page.co.kr/web/junam/look_surroundings_json.php"
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    //주변문화재
    public func getLookMonument(onCompletion: @escaping (JSON) -> Void) {
        let route = "http://next-page.co.kr/web/junam/look_monument_json.php"
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }

    
    //스토리여행
    public func getFunStory(onCompletion: @escaping (JSON) -> Void) {
        let route = "http://next-page.co.kr/web/junam/fun_story_json.php"
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }

    
    //시간여행
    public func getFunTime(onCompletion: @escaping (JSON) -> Void) {
        let route = "http://next-page.co.kr/web/junam/fun_time_json.php"
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }

    //사계여행
    public func getFunSeason(onCompletion: @escaping (JSON) -> Void) {
        let route = "http://next-page.co.kr/web/junam/fun_season_json.php"
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }

    //가이드등록
    public func getGuideInfo(onCompletion: @escaping (JSON) -> Void) {
        let route = "http://next-page.co.kr/web/junam/guide_info_json.php"
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }

    public func getNotice(onCompletion: @escaping (JSON) -> Void) {
        let route = "http://next-page.co.kr/web/junam/look_notice_json.php"
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }

    
    
    public func getLooKView(onCompletion: @escaping (JSON) -> Void) {
        let route = "http://next-page.co.kr/web/junam/look_view_json.php"
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }

    
    public func getLooKBeacon(onCompletion: @escaping (JSON) -> Void) {
        let route = "http://next-page.co.kr/web/junam/look_beacon_json.php"
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    public func getRandomUser(onCompletion: @escaping (JSON) -> Void) {
        let route = "http://www.a2big.com/test/json_test.php"
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    
    public func getVisitCourse(onCompletion: @escaping (JSON) -> Void) {
        let route = "http://next-page.co.kr/web/junam/look_view_json.php"
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }

    
    // MARK: Perform a GET Request
    private func makeHTTPGetRequest(path: String, onCompletion: @escaping ServiceResponse) {
        let request = NSMutableURLRequest(url: NSURL(string: path)! as URL)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if let jsonData = data {
                let json:JSON = JSON(data: jsonData)
                onCompletion(json, error as NSError?)
            } else {
                onCompletion(nil, error as NSError?)
            }
        })
        task.resume()
    }
    
    // MARK: Perform a POST Request
    private func makeHTTPPostRequest(path: String, body: [String: AnyObject], onCompletion: @escaping ServiceResponse) {
        let request = NSMutableURLRequest(url: NSURL(string: path)! as URL)
        
        // Set the method to POST
        request.httpMethod = "POST"
        
        do {
            // Set the POST body for the request
            let jsonBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            request.httpBody = jsonBody
            let session = URLSession.shared
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                if let jsonData = data {
                    let json:JSON = JSON(data: jsonData)
                    onCompletion(json, nil)
                } else {
                    onCompletion(nil, error as NSError?)
                }
            })
            task.resume()
        } catch {
            // Create your personal error
            onCompletion(nil, nil)
        }
    }
}
