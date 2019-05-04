//
//  GIF.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

struct GIF: Codable {
    
//    let type: TypeEnum
    let id, slug: String
    let url, bitlyGIFURL, bitlyURL, embedURL: String
    let username: String
    let source: String
//    let rating: Rating
    let contentURL, sourceTLD: String
    let sourcePostURL: String
    let isSticker: Int
    let importDatetime, trendingDatetime: String
//    let user: User?
//    let images: Images
    let title: String
    
}
