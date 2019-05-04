//
//  Result.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/3/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

enum Result<T> {
    case success(T)
    case failure(NetworkError)
}
