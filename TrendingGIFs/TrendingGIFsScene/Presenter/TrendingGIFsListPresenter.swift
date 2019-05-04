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
    //func mapMovieDetailsUIModel(_ movie: Movie) ->  MovieDetailViewModel
    //func getMovie(at index: IndexPath) -> MovieDetailViewModel
    //func navigateToMovieDetailViewController(_ newMovieDetails: @escaping addMovieDetailsAction)
    func numberOfSections() -> Int
    func numberOfRows(_ section: Int) -> Int
}
class TrendingGIFsListPresenter : TrendingGIFsListPresentable {
    
    private var fetchTrendingGIFsUseCase: FetchTrendingGIFsUseCase
    fileprivate weak var view: TrendingGIFsListViewProtocol?

    
    //MARK -: Intialization
    
    init(view: TrendingGIFsListViewProtocol,
         fetchTrendingGIFsUseCase: FetchTrendingGIFsUseCase) {
        self.view = view
        self.fetchTrendingGIFsUseCase = fetchTrendingGIFsUseCase
    }
    
    
    func fetchTrendingGIFs() {
        fetchTrendingGIFsUseCase.getGIFs()
    }
    
}
// MARK: - Handle TableView
extension TrendingGIFsListPresenter {
    
    func gifsCount() -> Int {
        return 0//getAllMovies()!.count
    }
    
    func numberOfSections() -> Int {
        return  0//moviesListTableViewSections.count
    }

    func numberOfRows(_ section: Int) -> Int {
        return 0//moviesListTableViewSections[section].movies.count
    }
}
