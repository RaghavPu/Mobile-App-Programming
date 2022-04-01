//
//  Game.swift
//  Wordle
//
//  Created by Punnam, Raghav S on 3/30/22.
//

import Foundation
import UIKit

class Game {
    var wordSet: Set<String>
    var correctWord: String
    
    var letters: [String:UIColor]
    
    init() {
        wordSet = Set<String>()
        letters = [:]
        correctWord = ""
        loadWordsDictionary()
        newWord()
    }
    
    func loadWordsDictionary() {
        if let dir = Bundle.main.url(forResource: "dictionary", withExtension: "txt", subdirectory: "") {

            //reading
            do {
                let text2 = try String(contentsOf: dir, encoding: .utf8)
                let words = text2.split(separator: "\n")
                for word in words {
                    if word.count == 5 {
                        wordSet.insert(String(word))
                    }
                }
            }
            catch {print(error.localizedDescription)}
        }
    }
    
    func checkWord(word: String) -> Bool {
        return wordSet.contains(word)
    }
    
    func newWord() {
        correctWord = wordSet.randomElement()!
        letters = [:]
    }
    
    func checkLetters(word: String) {
        let characters = Array(word)
        for c in 0..<characters.count {
            if characters[c] == Array(correctWord)[c] {
                letters[String(characters[c])] = .green
            } else if correctWord.contains(characters[c]) {
                letters[String(characters[c])] = .yellow
            } else {
                letters[String(characters[c])] = .darkGray
            }
        }

    }
}
