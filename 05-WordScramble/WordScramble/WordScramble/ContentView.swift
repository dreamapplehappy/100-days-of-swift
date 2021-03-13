//
//  ContentView.swift
//  WordScramble
//
//  Created by dreamapple on 2021/3/13.
//

import SwiftUI

struct ContentView: View {
    
    var people = ["a", "b", "c"]
    
    var body: some View {
//        List {
//            Section(header: Text("Section 1")) {
//                Text("Hello Wolrd")
//                Text("Hello Wolrd")
//                Text("Hello Wolrd")
//            }
//            Section(header: Text("Section 2")) {
//                ForEach(0 ..< 5) {
//                    Text("Row \($0)")
//                }
//            }
//        }
//        .listStyle(GroupedListStyle())
//        if let fileUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
//            if let fileContent = try? String(contentsOf: fileUrl) {
//                print(fileContent)
//            }
//        }
        
//        let input = """
//                    a
//                    b
//                    c
//                    """
//        let letters = input.components(separatedBy: "\n")
//        let letter = letters.randomElement()
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
//        print(trimmed)
        
        let words = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: words.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: words, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        if allGood {
            print("OK")
        }
        
        
        return List(people, id: \.self) {
            Text("List \($0)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
