//
//  TrendingGIFCollectionViewCell.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/5/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit
import SDWebImage

class TrendingGIFCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with gif: GIFViewModel?)  {
        guard gif != nil else {
            return
        }
        self.titleLabel.text = gif?.title
        gifImageView.sd_setImage(with: URL(string: gif?.images?.fixed_width.url ?? "placeholder.png"))

    }
    
}
