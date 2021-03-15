//
//  ContentView.swift
//  Animations
//
//  Created by dreamapple on 2021/3/14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmout: Double = 1
    
    var body: some View {
        
//        print(animationAmout)
        
//        return VStack {
//            Stepper("Scale amount", value: $animationAmout.animation(
//                Animation.easeInOut(duration: 3)
//                Animation.interpolatingSpring(stiffness: 50, damping: 2)
//            ), in: 1 ... 10)
//            Spacer()
//            Button("点击我") {
//                self.animationAmout += 1
//            }
//            .padding(36)
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmout)
//            .animation(.default)
            
//        }
        Button("点击我") {
            withAnimation(
                Animation.interpolatingSpring(stiffness: 30, damping: 2)
            ) {
                self.animationAmout += 360
            }
        }
        .padding(36)
        .background(Color.blue)
        .foregroundColor(Color.white)
        .clipShape(Circle())
        .rotation3DEffect(
            .degrees(animationAmout),
            axis: (x: 0.5, y: 1.0, z: 0.0)
        )
//        .scaleEffect(animationAmout)
//        .blur(radius: (animationAmout - 1) * 2)
//        .overlay(
//            Circle()
//                .stroke(Color.red)
//                .scaleEffect(animationAmout)
//                .opacity(Double(2 - animationAmout))
//                .animation(
//                    Animation.easeOut(duration: 1)
//                        .repeatForever(autoreverses: false)
//                )
//
//        )
//        .onAppear {
//            self.animationAmout = 2
//        }
//        .animation(
//            Animation.easeInOut(duration: 1)
//                .repeatForever(autoreverses: true)
//                .repeatCount(5, autoreverses: true)
//                .delay(1)
//        )
//        .animation(.easeIn(duration: 1))
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
