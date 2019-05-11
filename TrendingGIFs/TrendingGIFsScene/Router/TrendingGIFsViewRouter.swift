//
//  TrendingGIFsViewRouter.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/8/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit

protocol Navigator {
    associatedtype Destination
    func navigate(to destination: Destination)
}

enum Destination {
    case showDetailedGIF
}

class TrendingGIFsViewRouter: Navigator {
    
    private weak var viewController: TrendingGIFsViewController?
    private var detailedGIF = GIFViewModel()

    init(viewController: TrendingGIFsViewController) {
        self.viewController = viewController
    }
    
    func navigate(to destination: Destination) {
        guard let detailedGIFViewController =  makeViewController(for: destination) else {
            
            return
        }
        self.viewController?.navigationController?.pushViewController(detailedGIFViewController, animated: false)
    }
    
    func configureDetailedGIF(_ detailedGIF: GIFViewModel) {
        self.detailedGIF = detailedGIF
    }
    
    private func makeViewController(for destination: Destination) -> UIViewController? {
        switch destination {
            
        case .showDetailedGIF:            
            return initiateDetailedGIFViewController() ?? nil
        }
    }
    
    func initiateDetailedGIFViewController() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailedGIFViewController  = storyboard.instantiateViewController(withIdentifier: "DetailedGIFViewController") as? DetailedGIFViewController {
            
            detailedGIFViewController.detailedGIF = detailedGIF
            
            return detailedGIFViewController
        }
        
        return nil
    }
}
