//
//  ContentView.swift
//  BetterRest
//
//  Created by dreamapple on 2021/2/27.
//

import SwiftUI

struct ContentView: View {
    @State private var coffeeAmount = 1
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    @State private var isAlertShow = false
    
    static var defaultWakeTime: Date {
        var cmpt = DateComponents()
        cmpt.hour = 7
        cmpt.minute = 0
        return Calendar.current.date(from: cmpt) ?? Date()
    }
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 10) {
                    Text("你准备几点起床？")
                        .font(.headline)
                    DatePicker("选择起床的时间", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("你每天睡几个小时？")
                        .font(.headline)
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("你选择睡\(self.sleepAmount, specifier: "%g")小时")
                    }
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("你每天喝几杯咖啡？")
                        .font(.headline)
                    Stepper(value: $coffeeAmount, in: 1...20) {
                        Text("你选择喝\(self.coffeeAmount)杯咖啡")
                    }
                }
            }
            .navigationTitle("更好的睡眠")
            .navigationBarItems(trailing: Button(action: self.calculateSleepTime, label: {
                Text("预估几点睡觉")
            }))
            .alert(isPresented: $isAlertShow) {
                Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("确定")))
            }
        }
    }
    
    func calculateSleepTime() {
        let model = SleepTimeCalculator()
        let dateCmpt = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hours = (dateCmpt.hour ?? 0) * 60 * 60
        let minutes = (dateCmpt.minute ?? 0) * 60 * 60

        do {
            let prediction = try model.prediction(wake: Double(hours + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let bedTime = wakeUp - prediction.actualSleep
            let datefmt = DateFormatter()
            datefmt.timeStyle = .short
            let showBedTime = datefmt.string(from: bedTime)
            
            alertTitle = "预期的睡眠时间"
            alertMsg = showBedTime
            
        } catch {
            alertTitle = "出错了"
            alertMsg = "没有预测出来对应的时间"
        }
        
        isAlertShow = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
