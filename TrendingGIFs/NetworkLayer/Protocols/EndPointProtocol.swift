//
//  EndPointProtocol.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/3/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

typealias Headers = [String: String]
public typealias Parameters = [String: Any]

protocol EndPointProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: Headers? { get }
    var parameters: Parameters? { get }
}
