//
//  DetailedGIFView.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/8/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit
import Reusable

class DetailedGIFView: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gifImageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNibContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadNibContent()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loadNibContent()
    }
    

    func configure(with gif: GIFViewModel) {
        self.titleLabel.text = gif.title
        gifImageView.sd_setImage(with: URL(string: gif.images?.preview_gif.url ?? "placeholder.png"))
    }
}
