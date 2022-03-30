//
//  Game.swift
//  Wordle
//
//  Created by Punnam, Raghav S on 3/30/22.
//

import Foundation

class Game {
    var wordSet: Set<String>
    
    init() {
        wordSet = Set<String>()
        loadWordsDictionary()
    }
    
    func loadWordsDictionary() {
        let file = "dictionary.txt"
         
        var result = ""
         
        //if you get access to the directory
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
         
            //prepare file url
            print(dir)
            let fileURL = dir.appendingPathComponent(file)
         
            do {
                result = try String(contentsOf: fileURL, encoding: .utf8)
                print(result)
            }
            catch {print(error.localizedDescription)}
        }
         
        print(result)
        
    }
}
