//
//  ContentView.swift
//  Animations
//
//  Created by dreamapple on 2021/3/14.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    var amount: Double
    var anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading)
            , identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    
//    @State private var animationAmout: Double = 1
    @State private var enabled = false
    @State private var position = CGSize.zero
    @State private var isRectangleShow = true
    
    private var letters = Array("Hello SwiftUI")
    
    
    var body: some View {
        
        VStack {
            Button("Tap me") {
                withAnimation {
                    self.isRectangleShow.toggle()
                }
            }

            if isRectangleShow {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 200, height: 200, alignment: .center)
                    .transition(.pivot)
                    
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        
//        HStack(spacing: 0) {
//            ForEach(0 ..< letters.count) { idx in
//                Text(String(self.letters[idx]))
//                    .padding(5)
//                    .background(self.enabled ? Color.red : Color.blue)
//                    .foregroundColor(.white)
//                    .offset(self.position)
//                    .animation(Animation.default.delay(Double(idx) / 20))
//
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged {
//                    self.position = $0.translation
//                }
//                .onEnded { _ in
//                    self.position = .zero
//                    self.enabled.toggle()
//                }
//        )
        
//        LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 200, height: 200, alignment: .center)
//            .clipShape(Circle())
//            .offset(position)
//            .gesture(
//                DragGesture()
//                    .onChanged {
//                        self.position = $0.translation
//                    }
//                    .onEnded { _ in
//                        withAnimation(.spring()) {
//                            self.position = .zero
//                        }
//                    }
//            )
//            .animation(.easeIn)
        
//        Button("点击") {
//            self.enabled.toggle()
//        }
//        .frame(width: 200, height: 200, alignment: .center)
//        .background(enabled ? Color.blue : Color.red)
//        .foregroundColor(Color.white)
//        .animation(.default)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 100 : 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
//        .background(enabled ? Color.blue : Color.red)
        
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
//        Button("点击我") {
//            withAnimation(
//                Animation.interpolatingSpring(stiffness: 30, damping: 2)
//            ) {
//                self.animationAmout += 360
//            }
//        }
//        .padding(36)
//        .background(Color.blue)
//        .foregroundColor(Color.white)
//        .clipShape(Circle())
//        .rotation3DEffect(
//            .degrees(animationAmout),
//            axis: (x: 0.5, y: 1.0, z: 0.0)
//        )
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
