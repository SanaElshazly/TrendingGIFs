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
    
    //MARK- Properties
    var presenter: TrendingGIFsListPresentable?
    let configurator = TrendingGIFsViewConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        presenter?.fetchTrendingGIFs()
    }
    
}

extension TrendingGIFsListViewController:  UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0 //presenter?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0 //presenter?.numberOfRows(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesDetailsCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
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
        //moviesTableView.reloadData()
    }
}
