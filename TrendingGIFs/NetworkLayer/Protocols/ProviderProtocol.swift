//
//  ProviderProtocol.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/3/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

protocol ProviderProtocol {
    func request<T>(type: T.Type, service: EndPointProtocol, completion: @escaping (Result<T>) -> ()) where T: Decodable
}
