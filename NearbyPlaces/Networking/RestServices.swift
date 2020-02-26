//
//  RestServices.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


public class RestServices {
    // MARK: - Properties
    private static var manager: Alamofire.SessionManager = {
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        configuration.timeoutIntervalForResource = 15
        configuration.timeoutIntervalForRequest = 15
        
        let man = Alamofire.SessionManager(
            configuration: configuration
        )
        return man
    }()
    
    // MARK: - Request Methods
    static func request(_ URL: EndPointURL, parameters: Parameters?, encodedParams: [String]? = nil, requestType: HTTPMethod, encoding: ParameterEncoding, header: [String: String]? = nil) -> DataRequest {
        let url = URL.fullPath(encodedParams)
        return manager.request(url, method: requestType, parameters: parameters, encoding: encoding, headers: header)
    }
    
    static func request(_ URL: EndPointURL, httpBody: Data, encodedParams: [String]? = nil, requestType: HTTPMethod) -> DataRequest {
        guard let url = NSURL(string: URL.fullPath(encodedParams)) as URL? else {
            fatalError()
        }
        
        var request = URLRequest(url: url)
        request.httpBody = httpBody
        request.httpMethod = requestType.rawValue
        
        return manager.request(request)
    }
    
    // MARK: - Appliances
    public static func getResponse<T: Response>(_ endPoint: EndPointURL, successBlock: @escaping(_ response: T) -> (), errorBlock: @escaping(_ error: ErrorResponse) -> ()) {
        request(endPoint, parameters: nil, requestType: .get, encoding: JSONEncoding.default)
            .validate()
            .responseJSON(completionHandler: {
                response in
                if let contents = response.data {
                    if let statusCode = response.response?.statusCode, statusCode == 200 {
                        let responseData = T(contents)
                        successBlock(responseData)
                    } else {
                        let errorResponse = ErrorResponse(contents)
                        errorBlock(errorResponse)
                    }
                }
            })
    }
}
