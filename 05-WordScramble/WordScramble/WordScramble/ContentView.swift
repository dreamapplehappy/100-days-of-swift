//
//  ContentView.swift
//  WordScramble
//
//  Created by dreamapple on 2021/3/13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errTitle = ""
    @State private var errMsg = ""
    @State private var showErr = false
    
    @State private var score = 0
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("输入你的答案", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle.fill")
                    Text("\($0)")
                }
                
                // 当前用户的分数
                Text("您当前的分数是：\(score)")
            }
            .navigationTitle(rootWord)
            .onAppear(perform: startGame)
            .alert(isPresented: $showErr) {
                Alert(title: Text(errTitle), message: Text(errMsg), dismissButton: .default(Text("好的")))
            }
            .navigationBarItems(trailing: Button("重新开始") {
                self.startGame()
                usedWords = []
                newWord = ""
                score = 0
            })
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        
        guard isOriginal(word: answer) else {
            showErrorAlert(title: "之前已经用过这个单词", msg: "请使用新的单词")
            newWord = ""
            return
        }
        
        guard isPossible(word: answer) else {
            showErrorAlert(title: "不是从给出的单词中拼出的", msg: "请使用新的单词")
            newWord = ""
            return
        }
        
        guard isCorrect(word: answer) else {
            showErrorAlert(title: "没有这个单词", msg: "请使用新的单词")
            newWord = ""
            return
        }
        
        usedWords.insert(answer, at: 0)
        score += newWord.count
        newWord = ""
    }
    
    func startGame() {
        if let startFileUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileStr = try? String(contentsOf: startFileUrl) {
                let allGameWords = fileStr.components(separatedBy: "\n")
                rootWord = allGameWords.randomElement() ?? "hello"
                return
            }
        }
        
        fatalError("加载游戏文件失败")
    }
    
    // 是否重复出现
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    // 是否能够拼写
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        // 不能少于三个字母
        if word.count < 3 {
            return false
        }
        // 不能和给出的词一样
        if tempWord == word {
            return false
        }
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    // 是否是正确的单词
    func isCorrect(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func showErrorAlert(title: String, msg: String) {
        errTitle = title
        errMsg = msg
        showErr = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
