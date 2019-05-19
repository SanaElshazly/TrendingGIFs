//
//  FetchTrendingGIFsUseCase.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

class FetchTrendingGIFsUseCase {
    
    private let sessionProvider = URLSessionHandler()
    private var offset = 0
    
    func setOffset(_ offset: Int) {
        self.offset = offset
    }
    
    func fetchTrendingGIFs(completion: @escaping (TrendingGIFs) -> Void) {
        sessionProvider.request(type: TrendingGIFs.self, service: GiphyRequest.trendingGIFs(offset: offset)) { response in
            switch response {
            case let .success(gifs):
                print(gifs)
                completion(gifs)
                
            case let .failure(error):
                print(error)
            }
        }
    }

}
