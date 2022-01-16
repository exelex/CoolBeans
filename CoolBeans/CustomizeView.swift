//
//  CustomizeView.swift
//  CoolBeans
//
//  Created by Alexey Il on 15.01.2022.
//

import SwiftUI

struct CustomizeView: View {
    let drink: Drink
    
    @State private var size = 0
    @State private var isDecaf = false
    
    let sizeOptions = ["Small", "Medium", "Large"]
    
    var caffeine: Int {
        100
    }
    
    var calories: Int {
        100
    }
    
    var body: some View {
        Form {
            Section("Basic options") {
                Picker("Size", selection: $size) {
                    
                }
            }
        }
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView(drink: Drink.example)
    }
}
