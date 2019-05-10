//
//  FetchRandomGIFUseCase.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/8/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

class FetchRandomGIFUseCase {
    
    private let sessionProvider = URLSessionHandler()
    
    func fetchRandomGIF(completion: @escaping (GIF) -> Void) {
        sessionProvider.request(type: RandomGIF.self, service: GiphyRequest.randomGIF) { response in
            switch response {
            case let .success(gif):
                print(gif.data)
                completion(gif.data)
                
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
