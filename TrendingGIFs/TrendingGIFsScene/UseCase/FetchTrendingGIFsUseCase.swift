//
//  FetchTrendingGIFsUseCase.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

// TODO: add base usecase
/*protocol BaseUseCase {
    func execute<T: Decodable>(completion: @escaping (Result<T>) -> ())
}*/

class FetchTrendingGIFsUseCase {
    
    private let sessionProvider = URLSessionHandler()
    private var isFetchInProgress = false
    private var offset = 0
    
    func setOffset(_ offset: Int) {
        self.offset = offset
    }
    
    // TODO: for base usecase
//    func execute<T: Decodable>(completion: @escaping (Result<T>) -> ()){
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
