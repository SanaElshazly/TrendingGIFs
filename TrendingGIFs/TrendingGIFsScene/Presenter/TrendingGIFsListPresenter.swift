//
//  TrendingGIFsListPresenter.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

protocol TrendingGIFsListPresentable {
    func fetchTrendingGIFs()
    func gifsCount() -> Int
    //func downloadGIFImage(_ indexPath: IndexPath)
    func populateGIFDetails(_ gif: GIF) ->  GIFViewModel
    func getGIF(at index: IndexPath) -> GIFViewModel
    //func navigateToMovieDetailViewController(_ newMovieDetails: @escaping addMovieDetailsAction)
    func heightOfCell(at index: Int) -> Int
    func numberOfItemsInSection(_ section: Int) -> Int
}
class TrendingGIFsListPresenter : TrendingGIFsListPresentable {
    
    private var fetchTrendingGIFsUseCase: FetchTrendingGIFsUseCase
    fileprivate weak var view: TrendingGIFsListViewProtocol?
    var gifsList = [GIFViewModel]()

    
    //MARK -: Intialization
    
    init(view: TrendingGIFsListViewProtocol,
         fetchTrendingGIFsUseCase: FetchTrendingGIFsUseCase) {
        self.view = view
        self.fetchTrendingGIFsUseCase = fetchTrendingGIFsUseCase
    }
    
    
    func fetchTrendingGIFs() {
        fetchTrendingGIFsUseCase.fetchTrendingGIFs { (trendingGIFs) in
            //trendingGIFs.data
            
            DispatchQueue.main.async {
                for gif in trendingGIFs.data {
                    self.gifsList.append(self.populateGIFDetails(gif))
                }
                self.view?.reloadData()
            }
            
        }
    }
    
    //MARK:- UI Handling
    func getGIF(at index: IndexPath) -> GIFViewModel {
        let gif = gifsList[index.row]
        return gif
    }
    
    func populateGIFDetails(_ gif: GIF) ->  GIFViewModel {
        var gifViewModel = GIFViewModel()
        gifViewModel.title = gif.title
        gifViewModel.images = gif.images
//        gifViewModel.image = gif.
        return gifViewModel
    }
    
}
// MARK: - Handle TableView
extension TrendingGIFsListPresenter {
    
    func gifsCount() -> Int {
        return self.gifsList.count
    }
    
    func heightOfCell(at index: Int) -> Int {
        return Int(self.gifsList[index].images?.fixed_width.height ?? "200") ?? 200
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return gifsCount()
    }
}
