//
//  GIFImage.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/5/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation
struct GIFImage: Codable {
    let fixed_width: FixedWidth
}

struct FixedWidth: Codable {
    let url: String
    let width, height, size: String
    let mp4: String?
    let mp4_size: String?
    let webp: String
    let webp_size: String
    let frames, hash: String?
}
