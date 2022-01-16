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
                    ForEach(sizeOptions.indices) { index in
                        Text(sizeOptions[index])
                    }
                }
                .pickerStyle(.segmented)

                if drink.coffeeBased {
                    Stepper("Extra shots: \(extraShots)", value: $extraShots, in: 0...8)
                }

                Toggle("Decaffeinated", isOn: $isDecaf)
            }

            Section("Customizations") {
                Picker("Milk", selection: $milk) {
                    ForEach(menu.milkOptions) { option in
                        Text(option.name)
                            .tag(option)
                    }
                }

                if drink.coffeeBased {
                    Picker("Syrup", selection: $syrup) {
                        ForEach(menu.syrupOptions) { option in
                            Text(option.name)
                                .tag(option)
                        }
                    }
                }
            }

            Section("Estimates") {
                Text("**Caffeine:** \(caffeine)mg")
                Text("**Calories:** \(calories)")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(drink.name)
        .toolbar {
            Button("Save") {
                history.add(drink, size: sizeOptions[size], extraShots: extraShots, isDecaf: isDecaf, milk: milk, syrup: syrup, caffeine: caffeine, calories: calories)

                dismiss()
            }
        }
        .onAppear {
            guard isFirstAppearance else { return }

            if drink.servedWithMilk {
                milk = menu.milkOptions[1]
            }

            isFirstAppearance = false
        }
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView(drink: Drink.example)
    }
}
