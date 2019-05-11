//
//  AnimatedGIFView.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/9/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit
import Reusable

class AnimatedGIFView: UIView, NibOwnerLoadable {
    
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
    
    func configure(url: String, playerView: UIView) {
        self.addSubview(playerView)
        playerView.frame = self.bounds
    }
}
