//
//  Pagination.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/5/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

struct Pagination: Codable {
    let total_count, count, offset: Int
}
