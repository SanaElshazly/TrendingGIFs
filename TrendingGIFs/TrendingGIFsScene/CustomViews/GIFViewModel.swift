//
//  GIFViewModel.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/5/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit

struct GIFViewModel {
    var title : String?
    var image: UIImage?
    var images: GIFImage?

    init() {}
    init(title: String, image: UIImage, images: GIFImage) {
        self.title = title
        self.image = image
        self.images = images
    }
}
