//
//  GIFView.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/8/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit
import Reusable

class GIFView: UIView, NibOwnerLoadable {
    
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

        loadNibContent()
    }
    

    func configure(with gif: GIFViewModel) {
        gifImageView.sd_setImage(with: URL(string: gif.images?.preview_gif.url ?? "placeholder.png"))
    }
}
