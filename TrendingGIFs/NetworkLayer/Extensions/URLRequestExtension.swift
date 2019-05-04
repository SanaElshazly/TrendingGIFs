//
//  URLRequestExtension.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

extension URLRequest {
    
    init(service: EndPointProtocol) {
        let urlComponents = URLComponents(service: service)
        
        self.init(url: urlComponents.url!)
        
        httpMethod = service.method.rawValue
        if let endPointParameters = service.parameters  {
            try? self.configureParameters(urlParameters: endPointParameters, request: &self)
        }else {
            setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
    }
    
    fileprivate func configureParameters(urlParameters: Parameters, request: inout URLRequest) throws {
        let urlEncoder = URLEncoding()
        do {
            print(urlParameters)
            try urlEncoder.encode(&request, with: urlParameters)
        } catch {
            throw error
        }
    }
}
