//
//  TrendingGIFsPresenter.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

protocol TrendingGIFsPresentable {
    func fetchTrendingGIFs(with offset: Int)
    func populateGIFDetails(_ gif: GIF) ->  GIFViewModel
    func gif(at index: IndexPath) -> GIFViewModel
    func heightOfCell(at index: Int) -> Int
    func navigateToDetailedGIFViewController(_ detailedGIF: GIFViewModel)
}

class TrendingGIFsPresenter : TrendingGIFsPresentable {
    
    private var fetchTrendingGIFsUseCase: FetchTrendingGIFsUseCase
    fileprivate weak var view: TrendingGIFsViewProtocol?
    private var router: TrendingGIFsViewRouter?
    var gifsList = [GIFViewModel]()

    //MARK -: Intialization
    
    init(view: TrendingGIFsViewProtocol,
         fetchTrendingGIFsUseCase: FetchTrendingGIFsUseCase,
         router: TrendingGIFsViewRouter) {
        self.view = view
        self.fetchTrendingGIFsUseCase = fetchTrendingGIFsUseCase
        self.router = router
    }
    
    func fetchTrendingGIFs(with offset: Int = 0) {
        self.view?.showLoading()
        fetchTrendingGIFsUseCase.setOffset(offset)
        fetchTrendingGIFsUseCase.fetchTrendingGIFs { (trendingGIFs) in
            DispatchQueue.main.async {
                for gif in trendingGIFs.data {
                    self.gifsList.append(self.populateGIFDetails(gif))
                }
                self.view?.updateGIFs(with: self.gifsList)
                self.view?.hideLoading()

            }
        }
    }
    
    //MARK:- UI Handling
    
    func gif(at index: IndexPath) -> GIFViewModel {
        let gif = gifsList[index.row]
        return gif
    }
    
    func populateGIFDetails(_ gif: GIF) ->  GIFViewModel {
        var gifViewModel = GIFViewModel()
        gifViewModel.title = gif.title
        gifViewModel.images = gif.images
        return gifViewModel
    }
    
    // MARK:- Handle Navigation

    func navigateToDetailedGIFViewController(_ detailedGIF: GIFViewModel) {
        router?.configureDetailedGIF(detailedGIF)
        router?.navigate(to: .showDetailedGIF)
    }
}

// MARK: - Handle CollectionView

extension TrendingGIFsPresenter {
    func heightOfCell(at index: Int) -> Int {
        return Int(self.gifsList[index].images?.fixed_width.height ?? "200") ?? 200
    }
}
