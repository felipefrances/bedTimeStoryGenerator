//
//  File.swift
//
//
//  Created by Felipe on 15/03/24.
//

import Foundation
import ArgumentParser

struct Remove: ParsableCommand {
    static var configuration
    = CommandConfiguration(abstract: "Removes a custom keyword to the word bank.")
    
    @Option(name: .shortAndLong, help: "Removes a character to the character list")
    var character: String?
    
    @Option(name: .shortAndLong, help: "Removes a scenario to the scenario list")
    var scenario: String?

    @Option(name: .shortAndLong, help: "Removes a action to the action list")
    var action: String?

    @Option(name: .shortAndLong, help: "Removes a descriptor to the descriptor list")
    var descriptor: String?
        
    //takes the word given and removes it from an array chosen
    func deleteWord(_ name: String, from array: inout [String]) {
        if let index = array.firstIndex(of: name) {
            array.remove(at: index)
        }
    }
    
    func run() throws {
        
        //loads json wordbank
        if var loadedBank = WordBank.loadBank() {
            
            //removes character by name if user chooses any
            if let character = character {
                deleteWord(character, from: &loadedBank.characterBank)
            }
            
            //removes scenario by name if user chooses any
            if let scenario = scenario {
                deleteWord(scenario, from: &loadedBank.scenarioBank)
            }
            //removes action by name if user chooses any
            if let action = action {
                deleteWord(action, from: &loadedBank.actionBank)
            }
            //removes description by name if user chooses any
            if let descriptor = descriptor {
                deleteWord(descriptor, from: &loadedBank.descriptorBank)
            }
            
            loadedBank.saveBank()
        }
        
        print("You have successfully removed your words!")
        
    }
}
