//
//  Constants.swift
//  Task
//
//  Created by Sarankumar on 11/02/18.
//  Copyright © 2018 Infotech. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ success: Bool, _ result: AnyObject?, _ error: NSError?) -> Void
typealias Done = () -> Void

// Network Error codes
let kEmptyResponseErrorCode = 9999
let kNoInternetConnection = -1009

// HTTP Status codes
enum HTTPStatus: NSInteger {
    case ok = 200
    case created = 201
    case accepted = 202
    case nonAuthoritativeInformation = 203
    case noContent = 204
    case resetContent = 205
    case partialContent = 206
    case multiStatus = 207
    case alreadyReported = 208
    case unauthorized = 401
    case notFound = 404
}
enum HeadersType {
    case App
    case None
}
struct Constants {
    struct Header {
        static let Accept           = "Accept"
        static let ContentType      = "content-type"
        static let Platform         = "X-USER-PLATFORM"
    }
    struct RequestParams {
        static let Accept       = "Accept"
    }
    struct ContentType {
        static let JSON         = "text/plain"
        static let URLEncoded   = "application/x-www-form-urlencoded"
    }
}
