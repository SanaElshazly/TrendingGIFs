//
//  URLEncoder.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

public protocol URLEncoder {
    func encode( _  urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public struct URLEncoding: URLEncoder {
    public func encode(_ urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else {
            return
        }
        if var urlComponents = URLComponents(url: url ,
                                             resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            let queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)) }
            urlComponents.queryItems = queryItems
            urlRequest.url = urlComponents.url
            print(urlRequest.url!)
        }
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}
