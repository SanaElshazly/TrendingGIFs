//
//  TrendingGIFsViewController.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit

protocol TrendingGIFsViewProtocol: class {
    func showLoading()
    func hideLoading()
    func reloadData()
    func updateGIFs(with list: [GIFViewModel])
}

class TrendingGIFsViewController: UIViewController {
    
    //MARK- Outlets
    @IBOutlet private weak var trendingGIFsCollectionView: UICollectionView!
    var footerView:CustomFooterView?

    //MARK- Properties
    var presenter: TrendingGIFsListPresentable?
    let configurator = TrendingGIFsViewConfigurator()
    var gifsList : [GIFViewModel] = [] {
        didSet{
            DispatchQueue.main.async {
                print(self.gifsList.count)
                self.trendingGIFsCollectionView?.reloadData()
            }
        }
    }
    

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        configureTrendingGIFsCollectionView()
        presenter?.fetchTrendingGIFs(with: gifsList.count)
    }
    
    
    private func configureTrendingGIFsCollectionView() {
        trendingGIFsCollectionView.dataSource = self
        trendingGIFsCollectionView.delegate = self
        
        trendingGIFsCollectionView?.backgroundColor = UIColor.clear
        trendingGIFsCollectionView?.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
        // Set the GiphyLayout delegate
        if let layout = trendingGIFsCollectionView?.collectionViewLayout as? GiphyLayout {
            layout.delegate = self
        }
        trendingGIFsCollectionView.register(cellType: TrendingGIFCollectionViewCell.self)
    }
    
    func updateGIFs(with list: [GIFViewModel]) {
        gifsList = list
    }
    
}

extension TrendingGIFsViewController:  UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItemsInSection(section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath) as TrendingGIFCollectionViewCell

        cell.configureCell(with: presenter?.gif(at: indexPath))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let lastSectionIndex = (collectionView.numberOfSections)-1
        let lastItemIndex = (collectionView.numberOfItems(inSection: lastSectionIndex))

        let index =  IndexPath(item: lastItemIndex, section: lastSectionIndex)


//        let count = presenter?.gifsCount()
        if indexPath == index {
            presenter?.fetchTrendingGIFs(with: gifsList.count)
//            collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.navigateToDetailedGIFViewController(presenter?.gif(at: indexPath) ?? GIFViewModel())
    }
}

//MARK: - GIPHY LAYOUT DELEGATE
extension TrendingGIFsViewController : GiphyLayoutDelegate {
   
    // 1. Returns the photo height
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(presenter?.heightOfCell(at: indexPath.item) ?? 200)
    }
    
}

extension TrendingGIFsViewController: TrendingGIFsViewProtocol {
    func showLoading() {
//        loadingView.showLoading()
    }
    
    func hideLoading() {
//        loadingView.hideLoading()
    }
    
    func reloadData() {
        trendingGIFsCollectionView.reloadData()
    }
}
