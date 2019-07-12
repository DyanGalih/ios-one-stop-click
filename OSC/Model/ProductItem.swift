//
//  Product.swift
//  OSC
//
//  Created by Dyan Galih on 09/07/19.
//  Copyright © 2019 Dyan Galih. All rights reserved.
//

import Foundation

struct ProductItem: Equatable {
    static func == (lhs: ProductItem, rhs: ProductItem) -> Bool {
        return lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.price == rhs.price
            && lhs.promoted_product == rhs.promoted_product
            && lhs.thumbnail == rhs.thumbnail
    }

    var id: String
    var name: String
    var price: Int32
    var promoted_product: Bool
    var promote_title: String
    var thumbnail: String
}
