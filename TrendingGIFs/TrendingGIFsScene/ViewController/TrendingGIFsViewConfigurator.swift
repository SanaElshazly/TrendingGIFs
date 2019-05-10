//
//  TrendingGIFsViewConfigurator.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

class TrendingGIFsViewConfigurator: NSObject {
    func configure(viewController: TrendingGIFsViewController) {
        let fetchTrendingGIFsUseCase = FetchTrendingGIFsUseCase()
        let router = TrendingGIFsViewRouter(viewController: viewController)
        let presenter = TrendingGIFsListPresenter(view: viewController, fetchTrendingGIFsUseCase: fetchTrendingGIFsUseCase, router: router)
        viewController.presenter = presenter
    }
}
