//
//  DetailedGIFViewController.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/8/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

protocol DetailedGIFViewProtocol: class {
    func showLoading()
    func hideLoading()
    func configureAnimatedGIFView(with gif: GIFViewModel)
}

class DetailedGIFViewController: UIViewController {
    
    //MARK- Outlets
    @IBOutlet weak var animatedGIFView: AnimatedGIFView!
    
    //MARK- Properties
    var presenter: DetailedGIFPresentable?
    let configurator = DetailedGIFViewConfigurator()
    let playerController = AVPlayerViewController()
    var detailedGIF = GIFViewModel()
    let defaultUrl = URL(string:"https://media0.giphy.com/media/eYilisUwipOEM/200w.mp4")
    var player : AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        configureAnimatedGIFView(with: detailedGIF)
        presenter?.startRandomGIF()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presenter?.stopRandomGIF()
    }
    
    func configureAnimatedGIFView(with gif: GIFViewModel){
        
        let url = gif.images?.fixed_width.mp4 ?? ""
        player = AVPlayer(url: URL(string:url) ?? defaultUrl!)
        playerController.player = player
        self.addChild(playerController)

        animatedGIFView.configure(url: gif.images?.fixed_width.mp4 ?? "", playerView: playerController.view)
        player?.play()
    }
    
}

extension DetailedGIFViewController: DetailedGIFViewProtocol {
    func showLoading() {
        //        loadingView.showLoading()
    }
    
    func hideLoading() {
        //        loadingView.hideLoading()
    }
}

