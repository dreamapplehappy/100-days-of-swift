//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by dreamapple on 2021/2/17.
//

import SwiftUI

extension Image {
    func myShape() -> some View {
        self
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.white, lineWidth: 1))
            .shadow(color: .gray, radius: 2, x: 1, y: 1)
    }
}

struct FlagImage: View {
    var img: Image
    
    var body: some View {
        img.myShape()
    }
}



struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0 ... 2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var degreeAmount: Double = 0
    @State private var selectedIdx = -1
    @State private var scaleAmount: CGFloat = 1
    
    
    private var isThisRoundWon: Bool {
        selectedIdx == correctAnswer
    }
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 36) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text("\(countries[correctAnswer])")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text("your current score is: \(score)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.black)
                }
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.buttonTapped(number)
                    }) {
//                        Image(self.countries[number])
//                            .myShape()
                        FlagImage(img: Image(self.countries[number]))
                    }
                    .rotation3DEffect(
                        .degrees(self.isThisRoundWon && (self.selectedIdx == number) ? 360 : 0),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                    .animation(self.isThisRoundWon ? .default : nil)
                    .opacity((self.selectedIdx != number) && self.isThisRoundWon ? 0.25 : 1)
                    .animation(self.isThisRoundWon ? .default : nil)
                    .scaleEffect(!isThisRoundWon && (correctAnswer == number) ? self.scaleAmount : 1)
                    .animation(!self.isThisRoundWon ? .default : nil)
                    .alert(isPresented: $showingScore) {
                        Alert(title: Text(scoreTitle), message: Text("Your score is \(self.score), this flag is \(self.countries[number])"), dismissButton: .default(Text("dismiss")) {
                            self.askQuestion()
                        })
                    }
                }
                Spacer()
            }
        }
    }
    
    func buttonTapped(_ number: Int) {
        if number == correctAnswer {
            selectedIdx = number
            scoreTitle = "Correct"
            score += 10
        } else {
            scoreTitle = "Wrong"
            score -= 10
            scaleAmount = 1.2
        }
        showingScore = true
    }
    
    func askQuestion() {
        scaleAmount = 1
        selectedIdx = -1
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0 ... 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
