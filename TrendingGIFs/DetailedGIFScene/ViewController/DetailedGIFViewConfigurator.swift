//
//  DetailedGIFViewConfigurator.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/8/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

class DetailedGIFViewConfigurator: NSObject {
    func configure(viewController: DetailedGIFViewController) {
        let fetchRandomGIFUseCase = FetchRandomGIFUseCase()
        let presenter = DetailedGIFPresenter(view: viewController, fetchRandomGIFUseCase: fetchRandomGIFUseCase)
        viewController.presenter = presenter
    }
}
