//
//  TrendingGIFsRequest.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

enum TrendingGIFsRequest: EndPointProtocol {
    
    // MARK: - The Client API Key
    
    /// Replace this with your API key.
    //private(set) var apiKey: String
    
    
    // MARK: - Setting the Content Rating
    
    /// The rating to use for the requests.
    //public var rating: Rating = .g
    
    
    // MARK: - Filtering by Region
    //public var language: LanguageCode = .english
    
    case list(offset: Int)
    
    var baseURL: URL {
        return URL(string: "https://api.giphy.com/v1/gifs/")!
    }
    
    var path: String {
        switch self {
        case .list:
            return "trending"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: Headers? {
        return nil
    }
    
    var parameters: Parameters?{
        switch self {
        case let .list(offset):
            return ["apiKey": "t0zOHsUMtDuAJ5MjNwovdnzrtVQBWiRh",
                    "offset": offset,
                    "rating": "g"]
        }

    }

}
