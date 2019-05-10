//
//  DetailedGIFPresenter.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/8/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import Foundation

protocol DetailedGIFPresentable {
    func startRandomGIF()
    func stopRandomGIF()
    
}

class DetailedGIFPresenter : DetailedGIFPresentable {
    
    private var fetchRandomGIFUseCase: FetchRandomGIFUseCase
    fileprivate weak var view: DetailedGIFViewProtocol?
    var gifsList = [GIFViewModel]()
    lazy var timer = Timer(timeInterval: 10.0, target: self, selector: #selector(self.fetchRandomGIF), userInfo: nil, repeats: true)

    
    //MARK -: Intialization
    
    init(view: DetailedGIFViewProtocol,
         fetchRandomGIFUseCase: FetchRandomGIFUseCase) {
        self.view = view
        self.fetchRandomGIFUseCase = fetchRandomGIFUseCase
    }
    
    @objc func fetchRandomGIF() {
        self.view?.showLoading()
        fetchRandomGIFUseCase.fetchRandomGIF { (randomGIF) in
            //trendingGIFs.data
            print(randomGIF.title)
            
            DispatchQueue.main.async {
                
//                for gif in trendingGIFs.data {
//                    self.gifsList.append(self.populateGIFDetails(gif))
//                }
                self.view?.configureAnimatedGIFView(with: self.populateGIFDetails(randomGIF))
                
                //self.populateGIFDetails(randomGIF)
                self.view?.hideLoading()
                
            }
        }
    }
    
    func startRandomGIF(){
        RunLoop.current.add(timer, forMode: .common)
    }
    
    func stopRandomGIF(){
        timer.invalidate()
    }
    
    
    
    func populateGIFDetails(_ gif: GIF) ->  GIFViewModel {
        var gifViewModel = GIFViewModel()
        gifViewModel.title = gif.title
        gifViewModel.images = gif.images
        //        gifViewModel.image = gif.
        return gifViewModel
    }
    
}

extension DetailedGIFPresenter {
    
}
