//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by dreamapple on 2021/2/17.
//

import SwiftUI

struct ContentView: View {
    // 用户输入的数值
    @State private var userInputVal = ""
    // 用户选择的单位
    @State private var selectedUnit = 0
    // 待转换的单位
    @State private var unitToBeConverted = 1
    
    // 单位的列表
    let units = [
        (symbol: "℃", name: "摄氏度"),
        (symbol: "℉", name: "华氏度"),
        (symbol: "K", name: "开尔文")
    ]
    
    // 用户选择的单位的说明
    var userSelectedUnitDesc: String {
        return units[selectedUnit].name
    }
    
    // 用户选择的目标单位的说明
    var targetUnitDesc: String {
        return units[unitToBeConverted].name
    }
    
    // 温度转换的结果
    var targetVal: Double {
        // 用户输入的温度
        let userInputTemp = Double(userInputVal) ?? 0
        // 中间值摄氏度
        var tempVal: Double
        // 结果温度
        var resultVal: Double
        
        if selectedUnit == 1 {
            tempVal = unitF2C(userInputTemp)
        } else if selectedUnit == 2 {
            tempVal = unitK2C(userInputTemp)
        } else {
            tempVal = userInputTemp
        }
        // 获取用户选择的单位
        if unitToBeConverted == 1 {
            resultVal = unitC2F(tempVal)
        } else if unitToBeConverted == 2 {
            resultVal = unitC2K(tempVal)
        } else {
            resultVal = tempVal
        }
        
        print("---")
        
        return userInputVal != "" ? resultVal : 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("选择待转换的单位: \(userSelectedUnitDesc)")) {
                    Picker("温度单位", selection: $selectedUnit) {
                        ForEach(0 ..< self.units.count) {
                            Text("\(self.units[$0].symbol)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("请输入对应的数值", text: $userInputVal)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("选择转换的目标单位: \(targetUnitDesc)")) {
                    Picker("温度单位", selection: $unitToBeConverted) {
                        ForEach(0 ..< self.units.count) {
                            Text("\(self.units[$0].symbol)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("温度转换的结果是：\(targetVal, specifier: "%.2f")")
                }
            }
            .navigationTitle("温度转换")
        }
    }
    
    // 华氏度转换为摄氏度
    func unitF2C(_ temperature: Double) -> Double {
        return (temperature - 32) / 1.8
    }
    // 开尔文转换为摄氏度
    func unitK2C(_ temperature: Double) -> Double {
        return temperature - 273
    }
    // 摄氏度转换为华氏度
    func unitC2F(_ temperature: Double) -> Double {
        return 1.8 * temperature + 32
    }
    // 摄氏度转换为开尔文
    func unitC2K(_ temperature: Double) -> Double {
        return temperature + 273
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
