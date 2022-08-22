//
//  ContentView.swift
//  Test
//
//  Created by Matt Silveria on 6/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState var amountIsFocused: Bool
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double {
       let peopleCount = Double(numberOfPeople + 2)
       let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
       return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
        Form {
            
            Section {
                
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                
                Picker("Number of People", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                        
                    }
                }
            } header: {
                Text("Check Amount")
            }
            Section {
                
                Picker("Tip Percentage", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Tip Percentage")
            }
            
            Section {
                Text(totalPerPerson, format: . currency(code: Locale.current.currencyCode ?? "USD"))
                
                } header: {
                    Text("Amount per person")
                }
            }
        .navigationTitle("WeSplit")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
