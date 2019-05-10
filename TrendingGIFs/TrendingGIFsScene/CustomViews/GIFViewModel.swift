//
//  GIFViewModel.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/5/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit

struct GIFViewModel {
    var title : String? = "GIF Content"
    var image: UIImage? 
    var images: GIFImage?

    init() {}
    init(title: String? = "GIF Content" , image: UIImage? = UIImage(named: "placeholder.png")) {
        self.title = title
        self.image = image
    }
}
