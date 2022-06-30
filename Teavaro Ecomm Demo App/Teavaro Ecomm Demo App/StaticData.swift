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

var sections = [MenuSection(id: UUID(), name: "Section1", items: items1), MenuSection(id: UUID(), name: "Section2", items: items2), MenuSection(id: UUID(), name: "Sections3", items: items3)]

var items1 = [MenuItem(id: UUID(), name: "Meat", price: 10), MenuItem(id: UUID(), name: "Fish", price: 7), MenuItem(id: UUID(), name: "Chicken", price: 15)]
var items2 = [MenuItem(id: UUID(), name: "Mango", price: 5), MenuItem(id: UUID(), name: "Banana", price: 3), MenuItem(id: UUID(), name: "Strawberry", price: 6)]
var items3 = [MenuItem(id: UUID(), name: "Tomato", price: 2), MenuItem(id: UUID(), name: "Carrot", price: 1), MenuItem(id: UUID(), name: "Cucumber", price: 2)]
