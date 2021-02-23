//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by dreamapple on 2021/2/21.
//

import SwiftUI

struct MyText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct GridStack<Content: View>: View {
    var rows: Int
    var cols: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< self.rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.cols, id: \.self) { col in
                        self.content(row, col)
                    }
                }
            }
        }
    }
    
    init(rows: Int, cols: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.cols = cols
        self.content = content
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .padding(5)
                .font(.caption)
                .padding(5)
                .background(Color.gray)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct ProminentTitle: ViewModifier {
//    var title: String
    
    func body(content: Content) -> some View {
        VStack {
            content
                .font(.title)
                .foregroundColor(.blue)
        }
    }
}

extension View {
    func changeToProminentTitle() -> some View {
        self.modifier(ProminentTitle())
    }
}

struct ContentView: View {
//    @State private var useRedColor = false
    
//    let text1 = Text("text 1")
//    let text2 = Text("text 2")
//    var container: some View {
//        text1
//    }
    
    var body: some View {
//        VStack {
//            Text("Hello")
//        }
//        MyText(text: "Hello World")
        Text("Hello")
//            .watermarked(with: "hello")
            .changeToProminentTitle()
//        MyText(text: "Hello World")
//        Text("Hello")
//            .watermarked(with: "hello")
//        GridStack(rows: 3, cols: 3) { row, col in
//            HStack {
//                Text("\(row * col)")
//                Image(systemName: "\(row * 3 + col).circle")
//            }
//            Text("\(row * col)")
//            Image(systemName: "\(row * 3 + col).circle")
//        }
//        Text("First")
//            .font(.largeTitle)
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.blue)
//            .clipShape(Capsule())
//        VStack {
//            text1
//                .foregroundColor(.blue)
//            text2
//            container
//        }
//        Button("tap me") {
//            print(type(of: self.body))
//            self.useRedColor.toggle()
//        }
//        .foregroundColor(useRedColor ? .red : .black)
//        if self.useRedColor {
//            return Button("Hello Red") {}
//                .background(Color.black)
//        } else {
//            return Button("Hello Blue") {}
//                .background(Color.black)
//        }
//        VStack {
//            Text("Hello World")
//                .font(.title)
//                .blur(radius: 0)
//            Text("Hello World")
//            Text("Hello World")
//            Text("Hello World")
//        }
//        .font(.largeTitle)
//        .blur(radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
