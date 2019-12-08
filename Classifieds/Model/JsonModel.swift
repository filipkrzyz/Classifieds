//
//  JsonModel.swift
//  Classifieds
//
//  Created by Filip Krzyzanowski on 08/12/2019.
//  Copyright © 2019 Filip Krzyzanowski. All rights reserved.
//

import Foundation


/// Structure representing a response from the pixbay rest API
struct Response: Decodable{
    var hits: [ImageData]
}

/// Data model of each image item returned by pixbay rest API
struct ImageData: Decodable {
    var webformatURL: String
    var tags: String
    var user: String
}
