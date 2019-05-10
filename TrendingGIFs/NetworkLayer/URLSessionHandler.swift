//
//  URLSessionHandler.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

final class URLSessionHandler: ProviderProtocol {
    
    private var session: URLSessionProtocol
    fileprivate var task: URLSessionTask?

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request<T>(type: T.Type, service: EndPointProtocol, completion: @escaping (Result<T>) -> ()) where T: Decodable {
        
        let request = URLRequest(service: service)
        task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            
            guard let json = data else {
                print("No data")
                return
            }
            
            guard json.count != 0 else {
                print("Zero bytes of data")
                return
            }
            print(String(decoding: json, as: UTF8.self))
            
            
            self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        

        task?.resume()
    }
    
    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (Result<T>) -> ()) {
        guard error == nil else { return completion(.failure(.unknown)) }
        guard let response = response else { return completion(.failure(.noJSONData)) }
        
        switch response.statusCode {
        case 200...299:
//            print( try? JSONDecoder().decode(TrendingGIFs.self, from: data!))

            guard let data = data, let model = try? JSONDecoder().decode(T.self, from: data) else { return
                completion(.failure(.unknown)) }
            completion(.success(model))
        default:
            completion(.failure(.unknown))
        }
    }

}
