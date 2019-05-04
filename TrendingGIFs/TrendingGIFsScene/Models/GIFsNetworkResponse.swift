//
//  GIFsNetworkResponse.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

struct GIFsNetworkResponse: Codable {
    let data: [GIF]
    let pagination: Pagination
}
