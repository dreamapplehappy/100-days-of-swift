//
//  ContentView.swift
//  BrainTrainingGame
//
//  Created by dreamapple on 2021/2/24.
//

import SwiftUI

struct ContentView: View {
    // 石头剪刀布
    let options = [(name: "石头", val: 1), (name: "剪刀", val: 2), (name: "布", val: 3)]
    let totalCount = 10
    
    @State private var currentSelect = Int.random(in: 0..<3)
    @State private var tipSelect = Int.random(in: 0..<3)
    @State private var userSelect: Int = 1
    @State private var showAlert = false
    @State private var currentCount = 0
    
    var leftTimes: Int {
        totalCount - currentCount
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 36) {
                Spacer()
                Text("当前系统选择的可能是：\(self.options[self.tipSelect].name)")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("你当前的分数是：123")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.regular)
                HStack {
                    ForEach(options, id: \.self.name) { option in
                        Button(action: {
                            //
                            
                            if self.leftTimes > 0 {
                                self.showAlert = true
                            } else {
                                print("---")
                            }
                        }) {
                            Text("\(option.name)")
                                .foregroundColor(.primary)
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        .frame(width: 100, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .shadow(color: .yellow, radius: 10, x: 5, y: 5)
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("xx"), message: Text("---"), dismissButton: .cancel(Text("下一回合")) {
                                //
                                self.showAlert = false
                                self.currentCount += 1
                            })
                        }
                    }
                }
                Text("还剩下\(self.leftTimes)回合")
                    .foregroundColor(.yellow)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
