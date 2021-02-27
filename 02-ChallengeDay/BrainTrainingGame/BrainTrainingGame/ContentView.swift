//
//  ContentView.swift
//  BrainTrainingGame
//
//  Created by dreamapple on 2021/2/24.
//

import SwiftUI

struct ContentView: View {
    // 石头剪刀布
    let options = [(name: "石头", defeat: "剪刀"), (name: "剪刀", defeat: "布"), (name: "布", defeat: "石头")]
    let totalCount = 10
    
    @State private var currentSelect = 0
    @State private var tipSelect = 0
    @State private var userSelect: Int = 1
    @State private var showAlert = false
    @State private var currentCount = 0
    @State private var myScore = 0
    
    @State private var alertTitle = ""
    @State private var alertContent = ""
    @State private var btnText = "下一回合"
    
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
                Text("你当前的分数是：\(self.myScore)")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.regular)
                HStack {
                    ForEach(options, id: \.self.name) { option in
                        Button(action: {
                            self.randomOption(userSelect: option)
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
                            Alert(title: Text(self.alertTitle), message: Text(self.alertContent), dismissButton: .cancel(Text(self.btnText)) {
                                //
                                self.showAlert = false
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
    
    func randomOption(userSelect: (String, String)) {
        if self.leftTimes > 0 {
            self.currentSelect = Int.random(in: 0 ..< self.options.count)
            self.tipSelect = Int.random(in: 0 ..< self.options.count)
            print(userSelect)
            let uShowDefeat = userSelect.1
            let sysShow = self.options[self.currentSelect].name
            
            if uShowDefeat == sysShow {
                self.alertTitle = "恭喜，你赢了"
                self.myScore += 10
            } else {
                self.alertTitle = "抱歉，你输了"
                self.myScore -= 10
            }
            self.currentCount += 1
            self.alertContent = "本回合系统的选择是：\(sysShow)"
        } else {
            self.alertTitle = "游戏已经结束了"
            self.alertContent = "你的最终得分是：\(self.myScore)"
            self.btnText = "确定"
        }
        self.showAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
