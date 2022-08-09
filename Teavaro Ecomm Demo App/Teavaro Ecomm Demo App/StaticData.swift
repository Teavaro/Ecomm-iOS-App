//
//  StaticData.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 22/06/2022.
//

import SwiftUI
import Foundation

struct MenuSection: Identifiable {
    var id: UUID
    var name: String
    var items: [MenuItem]
}

struct MenuItem: Equatable, Identifiable, Hashable {
    var id: UUID
    var name: String
    var price: Double
}

class Order: ObservableObject {
    
    @Published var items = [MenuItem]()

    var total: Int {
        if items.count > 0 {
            return Int(items.reduce(0) { $0 + $1.price })
        } else {
            return 0
        }
    }

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}


