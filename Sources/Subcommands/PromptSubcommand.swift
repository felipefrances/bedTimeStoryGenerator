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
    
    //function to help with verbose
    func writeExplanation() {
        if verbose {
            let explanationText = ["Choosing an incredible description...", "Generating a wonderful character...", "Picking an exciting action...", "Thinking about an amazing scenario...", "Ok, here it comes..."]
            
            for phrase in explanationText {
                verboseText(phrase, condition: verbose)
            }
        }
    }
    
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
            dotImage()
            
            //explains the process if verbose
            writeExplanation()
            
            print("Once upon a time there was:")
            print(prompt)
        }
    }
}
