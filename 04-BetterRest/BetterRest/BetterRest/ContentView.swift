//
//  ContentView.swift
//  BetterRest
//
//  Created by dreamapple on 2021/2/27.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    var body: some View {
        
        var dateCmpt = DateComponents()
        dateCmpt.hour = 8
        dateCmpt.minute = 0
        let date1 = Calendar.current.date(from: dateCmpt) ?? Date()
        print(date1.description)
        
        let dateCpmt1 = Calendar.current.dateComponents([.hour, .minute], from: date1)
        let hours = dateCpmt1.hour ?? 0
        let minutes = dateCpmt1.minute ?? 0
        print(hours, minutes)
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateStr = formatter.string(from: date1)
        print(dateStr)
        
        return Form {
            DatePicker("Choose your wake up time", selection: $wakeUp, in: Date()...)
//            DatePicker(<#T##titleKey: LocalizedStringKey##LocalizedStringKey#>, selection: <#T##Binding<Date>#>, displayedComponents: <#T##DatePicker<Text>.Components#>)
        }
//        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
//            Text("\(self.sleepAmount, specifier: "%g") hours")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
