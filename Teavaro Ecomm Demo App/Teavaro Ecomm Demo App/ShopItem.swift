//
//  Item.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import Foundation

struct ShopItem: Identifiable,Equatable{
    public var id: Int16
    public var title: String
    public var description: String
    public var price: Float
    public var picture: String
    public var isOffer: Bool = false
    public var isInStock: Bool = true
    public var isWish: Bool = false
    public var countOnCart: Int = 1
}
