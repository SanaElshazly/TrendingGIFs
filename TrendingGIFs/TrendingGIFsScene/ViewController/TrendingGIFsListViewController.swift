//
//  TrendingGIFsListViewController.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/4/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit

protocol TrendingGIFsListViewProtocol: class {
    func showLoading()
    func hideLoading()
    func reloadData()
}

class TrendingGIFsListViewController: UIViewController {
    
    //MARK- Outlets
    @IBOutlet private weak var trendingGIFsCollectionView: UICollectionView!
    //@IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    
    //MARK- Properties
    var presenter: TrendingGIFsListPresentable?
    let configurator = TrendingGIFsViewConfigurator()
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        configuretrendingGIFsTableView()
        presenter?.fetchTrendingGIFs()
    }
    
    
    private func configuretrendingGIFsTableView() {
        trendingGIFsCollectionView.dataSource = self
        trendingGIFsCollectionView.delegate = self
        
        trendingGIFsCollectionView?.backgroundColor = UIColor.clear
        trendingGIFsCollectionView?.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
        // Set the GiphyLayout delegate
        if let layout = trendingGIFsCollectionView?.collectionViewLayout as? GiphyLayout {
            layout.delegate = self
        }
        
        let cellNib = UINib(nibName: "TrendingGIFCollectionViewCell", bundle: nil)
        trendingGIFsCollectionView.register(cellNib, forCellWithReuseIdentifier: "TrendingGIFCollectionViewCell")
    }
    
}

extension TrendingGIFsListViewController:  UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItemsInSection(section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingGIFCollectionViewCell", for: indexPath) as! TrendingGIFCollectionViewCell
        cell.configureCell(with: presenter?.getGIF(at: indexPath))
        
        return cell
    }
}

//MARK: - GIPHY LAYOUT DELEGATE
extension TrendingGIFsListViewController : GiphyLayoutDelegate {
   
    // 1. Returns the photo height
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(presenter?.heightOfCell(at: indexPath.item) ?? 200)
    }
}

extension TrendingGIFsListViewController: TrendingGIFsListViewProtocol {
    func showLoading() {
        //indicatorView.startAnimating()
    }
    
    func hideLoading() {
        //indicatorView.stopAnimating()
    }
    
    func reloadData() {
        trendingGIFsCollectionView.reloadData()
    }
}
