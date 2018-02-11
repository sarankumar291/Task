//
//  TaskService.swift
//  Task
//
//  Created by Sarankumar on 11/02/18.
//  Copyright © 2018 Sarankumar. All rights reserved.
//

import Foundation
import Alamofire

func HTTPHeaders(forType type: HeadersType) -> [String: String]? {
    var headers: [String: String] = [:]
    switch type {
    case .App:
        headers[Constants.Header.ContentType] = Constants.ContentType.JSON
    case .None:
        break
    }
    return headers
}

class TaskService {
    class func request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        headersType: HeadersType,
        parameters: Parameters? = nil,
        _ completionHandler: @escaping CompletionHandler) {
        guard let headers = HTTPHeaders(forType: headersType) else {
            completionHandler(false, nil, nil)
            return
        }
        print(url)
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            guard let httpResponse = response.response else {
                if let error = response.error as NSError?, error.code == kNoInternetConnection {
                    completionHandler(false, nil, error)
                } else {
                    let error = NSError(domain: "No response", code: kEmptyResponseErrorCode, userInfo: nil)
                    completionHandler(false, nil, error)
                }
                return
            }
            var isSuccess = false
            switch httpResponse.statusCode {
            case 200 ... 299:
                isSuccess = true
            case 400 ... 499:
                print(httpResponse.statusCode)
            case 500 ... 599:
                print(httpResponse.statusCode)
            default:
                print("unknown error \(httpResponse.statusCode)")
            }
            print(httpResponse.statusCode)
            // make sure we got data in the response
            guard let responseData = response.data else {
                completionHandler(isSuccess, response.result.value as AnyObject?, response.error as NSError?)
                return
            }
            guard let iso = String(data: responseData, encoding: String.Encoding.isoLatin1) else {
                completionHandler(isSuccess, response.result.value as AnyObject?, response.error as NSError?)
                return
            }
            guard let dataObj = iso.data(using: String.Encoding.utf8) else {
                completionHandler(isSuccess, response.result.value as AnyObject?, response.error as NSError?)
                return
            }
            // parse the result as JSON
            do{
                if let jsonObj = try JSONSerialization.jsonObject(with: dataObj, options: []) as? [String: Any] {
                    completionHandler(isSuccess, jsonObj as AnyObject?, response.error as NSError?)
                } else {
                    completionHandler(isSuccess, response.result.value as AnyObject?, response.error as NSError?)
                }
            } catch{
                completionHandler(isSuccess, response.result.value as AnyObject?, response.error as NSError?)
            }
        }
    }
}
