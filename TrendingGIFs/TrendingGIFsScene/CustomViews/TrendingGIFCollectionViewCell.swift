//
//  TrendingGIFCollectionViewCell.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/5/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit
import Reusable
import SDWebImage

class TrendingGIFCollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var gifView: GIFView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with gif: GIFViewModel?)  {
        guard gif != nil else {
            return
        }
        
        self.gifView.configure(with: gif ?? GIFViewModel())
    }
    
}
