//
//  ContentView.swift
//  WeSplit
//
//  Created by dreamapple on 2021/2/16.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var peopleCount = ""
//    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmount: Double {
        let tipAmountPercentage = Double(tipPercentages[tipPercentage]) / 100
        let costAmount = Double(checkAmount) ?? 0
        let totalAmount = costAmount * (1 + tipAmountPercentage)
        return totalAmount
    }
    
    var totalPerPerson: Double {
        let peopleNum = Double(peopleCount) ?? 0
        var showAmount: Double = 0
        if peopleNum > 0 {
            showAmount = totalAmount / peopleNum
        }
        return showAmount
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of people", text: $peopleCount)
                        .keyboardType(.numberPad)
                    
//                    Picker("Number of people", selection: $numberOfPeople) {
//                        ForEach(2 ..< 99) {
//                            Text("\($0) people")
//                        }
//                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .textCase(.none)
                
                Section(header: Text("Total amount for the check")) {
                    Text("\(totalAmount, specifier: "%.2f")")
                }
                .textCase(.none)
                
                Section(header: Text("Amount per person")) {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                        .foregroundColor(self.tipPercentages[self.tipPercentage] == 0 ? .red : .blue)
                }
                .textCase(.none)
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
