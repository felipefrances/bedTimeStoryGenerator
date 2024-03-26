//
//  File.swift
//
//
//  Created by Felipe on 15/03/24.
//

import Foundation
import ArgumentParser

struct List: ParsableCommand {
    static var configuration
    = CommandConfiguration(abstract: "Lists the entire word bank.")
    
    func list(_ word: String, array: [String], color: String) {
        printColor(color: color, text: word.uppercased())
//        print(word.uppercased())
        for i in array {
            printColor(color: color, text: i.capitalized)
//            print(i.capitalized)
        }
        print()
    }
    
    func run() throws {
        //loads json wordbank and lists every word by category
        if let loadedBank = WordBank.loadBank() {
            list("--Descriptor--", array: loadedBank.descriptorBank, color: Colors.cyan)
            list("--Character--", array: loadedBank.characterBank, color: Colors.magenta)
            list("--Action--", array: loadedBank.actionBank, color: Colors.yellow)
            list("--Scenario--", array: loadedBank.scenarioBank, color: Colors.green)
        }
    }
}
