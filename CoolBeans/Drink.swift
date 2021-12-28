//
//  Drink.swift
//  CoolBeans
//
//  Created by Alexey Il on 28.12.2021.
//

import Foundation

struct Drink: Identifiable, Codable {
    let id: UUID
    let name: String
    
    static let example = Drink(id: UUID(), name: "Example drink")
}
