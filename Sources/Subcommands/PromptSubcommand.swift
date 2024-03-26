//
//  File.swift
//  
//
//  Created by Felipe on 15/03/24.
//

import Foundation
import ArgumentParser

struct Prompt: ParsableCommand {

    static var configuration
    = CommandConfiguration(abstract: "Randomly generates a story prompt.")
    
    @Flag(name: .shortAndLong, help: "Show the generating process")
    var verbose = false
    
    func run() throws {
        
        //loads json wordbank
        if let loadedBank = WordBank.loadBank() {
            
            //shuffles and chooses random words
            let chosenCharacter = loadedBank.characterBank.randomElement()
            let chosenDescriptor = loadedBank.descriptorBank.randomElement()
            let chosenAction = loadedBank.actionBank.randomElement()
            let chosenScenario = loadedBank.scenarioBank.randomElement()
            
            let prompt = "A \(chosenDescriptor ?? "happy") \(chosenCharacter ?? "child") \(chosenAction ?? "playing") in a \(chosenScenario ?? "field")"
            
            //ascii image
            printColor(color: Colors.green, text: book)

            //explains the process if verbose
            writeExplanation(condition: verbose)
            
            //TODO: Color
            sleep(1)
            printColor(color: Colors.green, text: "Once upon a time there was:")
            sleep(1)
            printColor(color: Colors.yellow, text: prompt)
            print()
        }
    }
}
