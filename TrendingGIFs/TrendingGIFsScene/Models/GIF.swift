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
    let url, bitly_gif_url, bitly_url, embed_url: String
    let username: String
    let source: String
//    let rating: Rating
    let content_url, source_tld: String
    let source_post_url: String
    let is_sticker: Int
    let import_datetime, trending_datetime: String
//    let user: User?
//    let images: Images
    let title: String
    
}
