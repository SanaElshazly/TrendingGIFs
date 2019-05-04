//
//  FetchTrendingGIFsUseCase.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

protocol BaseUseCase {
    func execute<T>(completion: @escaping (Result<T>) -> ()) where T: Decodable
}

class FetchTrendingGIFsUseCase: BaseUseCase {
    
    private let sessionProvider = URLSessionHandler()
    private var isFetchInProgress = false
    private var toBeLoadedPage = 0
    
    func setPageNumber(_ page: Int) {
        self.toBeLoadedPage = page
    }
    
    func execute<T>(completion: @escaping (Result<T>) -> ()) where T: Decodable {
        sessionProvider.request(type: [GIF].self, service: TrendingGIFsRequest.list(offset: 0)) { response in
            switch response {
            case let .success(gifs):
                print(gifs)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getGIFs() {
        sessionProvider.request(type: [GIFsNetworkResponse].self, service: TrendingGIFsRequest.list(offset: 0)) { response in
            switch response {
            case let .success(gifs):
                print(gifs)
            case let .failure(error):
                print(error)
            }
        }
    }

}
