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
    private var isFetchInProgress = false
    private var toBeLoadedPage = 0
    
    func setPageNumber(_ page: Int) {
        self.toBeLoadedPage = page
    }
    
    func FetchTrendingGIFs(completion: @escaping (GIFsNetworkResponse) -> Void) {
        sessionProvider.request(type: GIFsNetworkResponse.self, service: TrendingGIFsRequest.list(offset: 0)) { response in
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
