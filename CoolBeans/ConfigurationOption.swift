//
//  ConfigurationOption.swift
//  CoolBeans
//
//  Created by Alexey Il on 16.01.2022.
//

import Foundation

struct ConfigurationOption: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let calories: Int
    
    static let none = ConfigurationOption(id: UUID(), name: "None", calories: 0)
}
