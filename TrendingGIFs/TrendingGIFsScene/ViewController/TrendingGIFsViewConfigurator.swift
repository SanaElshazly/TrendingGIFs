//
//  TrendingGIFsViewConfigurator.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

class TrendingGIFsViewConfigurator: NSObject {
    func configure(viewController: TrendingGIFsListViewController) {
        let fetchTrendingGIFsUseCase = FetchTrendingGIFsUseCase()
//        let router = MoviesListNavigator(viewController: moviesListViewController)
        let presenter = TrendingGIFsListPresenter(view: viewController, fetchTrendingGIFsUseCase: fetchTrendingGIFsUseCase)
        viewController.presenter = presenter
    }
}
