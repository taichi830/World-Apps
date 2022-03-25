//
//  API.swift
//  World Apps
//
//  Created by taichi on 2022/03/22.
//

import Foundation
import Combine
import Alamofire

enum CountryID: String {
    case japan = "jp"
    case korea = "kr"
    case usa = "us"
    case taiwan = "tw"
    case france = "fr"
    case spain = "es"
}

struct API {
    
    enum Chart: String {
        case free = "top-free"
        case paid = "top-paid"
    }
    
    enum Limit: String {
        case ten = "10"
        case twentyFive = "25"
        case fifty = "50"
    }
    
    static let shared = API()
    
    private let baseUrl = "https://rss.applemarketingtools.com/api/v2"
    
    
    
    func fetchAppRanking(country: CountryID, chart: Chart, limit: Limit) -> Future<Apps, Error> {
        return Future { promise in
            let country = "/" + country.rawValue
            let chart = "/" + chart.rawValue
            let limit = "/" + limit.rawValue
            
            let url = baseUrl + country + "/apps" + chart + limit + "/apps.json"
            let request = AF.request(url)
            
            request.responseDecodable(of: Apps.self) { response in
                guard let statusCode = response.response?.statusCode else { return }
                if statusCode <= 300 {
                    do {
                        guard let data = response.data else { return }
                        let decoder = JSONDecoder()
                        let value = try decoder.decode(Apps.self, from: data)
                        promise(.success(value))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
            request.resume()
        }
    }
    
    
}

