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
    private static func request(_ URL: EndPointURL, parameters: Parameters?, encodedParams: [String]? = nil, requestType: HTTPMethod, encoding: ParameterEncoding, header: [String: String]? = nil) -> DataRequest {
        let url = URL.fullPath(encodedParams)
        return manager.request(url, method: requestType, parameters: parameters, encoding: encoding, headers: header)
    }
    
    private static func request(_ URL: EndPointURL, httpBody: Data, encodedParams: [String]? = nil, requestType: HTTPMethod) -> DataRequest {
        guard let url = NSURL(string: URL.fullPath(encodedParams)) as URL? else {
            fatalError()
        }
        
        var request = URLRequest(url: url)
        request.httpBody = httpBody
        request.httpMethod = requestType.rawValue
        
        return manager.request(request)
    }
    
    // MARK: - Get Response
    public static func getResponse<T: Response>(_ endPoint: EndPointURL, type: T.Type, parameters: Parameters?, successBlock: @escaping(_ response: T) -> (), errorBlock: @escaping(_ error: ErrorResponse) -> ()) {
        request(endPoint, parameters: parameters, requestType: .get, encoding: NOURLEncoding())
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
    
    public static func getData(_ endPoint: EndPointURL, parameters: Parameters?, successBlock: @escaping(_ data: Data) -> (), errorBlock: @escaping(_ error: ErrorResponse) -> ()) {
        request(endPoint, parameters: parameters, requestType: .get, encoding: NOURLEncoding())
            .validate()
            .responseData { (response) in
                if let data = response.data {
                    if let statusCode = response.response?.statusCode, statusCode == 200 {
                        successBlock(data)
                    } else {
                        let errorResponse = ErrorResponse(response.data ?? Data())
                        errorBlock(errorResponse)
                    }
                }
        }
    }
}
