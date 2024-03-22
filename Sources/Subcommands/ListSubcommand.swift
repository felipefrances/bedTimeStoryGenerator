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
    
    func list(_ word: String, array: [String]) {
        print(word.uppercased())
        for i in array {
            print(i.capitalized)
        }
        print()
    }
    
    func run() throws {
        //loads json wordbank and lists every word by category
        if let loadedBank = WordBank.loadBank() {
            list("Descriptor", array: loadedBank.descriptorBank)
            list("Character", array: loadedBank.characterBank)
            list("Action", array: loadedBank.actionBank)
            list("Scenario", array: loadedBank.scenarioBank)
        }
    }
}
