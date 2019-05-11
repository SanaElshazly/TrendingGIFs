//
//  TrendingGIFsRequest.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

enum GiphyRequest: EndPointProtocol {
    
    case trendingGIFs(offset: Int)
    case randomGIF

    
    var baseURL: URL {
        return URL(string: "https://api.giphy.com/v1/gifs/")!
    }
    
    var path: String {
        switch self {
        case .trendingGIFs:
            return "trending"
        case .randomGIF:
            return "random"
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
        case let .trendingGIFs(offset):
            return ["api_key": "t0zOHsUMtDuAJ5MjNwovdnzrtVQBWiRh",
                    "limit": 20,
                    "offset": offset,
                    "rating": "g"]
        case .randomGIF:
            return ["api_key": "t0zOHsUMtDuAJ5MjNwovdnzrtVQBWiRh",
                    "rating": "g"]
        }

    }

}
