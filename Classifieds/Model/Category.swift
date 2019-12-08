//
//  Category.swift
//  Classifieds
//
//  Created by Filip Krzyzanowski on 08/12/2019.
//  Copyright © 2019 Filip Krzyzanowski. All rights reserved.
//

import Foundation

struct Category {
    var categoryId: Int
    var categoryName: String
    var clicks: Int
    var images: [ImageData]?
}
