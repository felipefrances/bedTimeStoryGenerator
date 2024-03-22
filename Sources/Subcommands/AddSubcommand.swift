//
//  File.swift
//  
//
//  Created by Felipe on 15/03/24.
//

import Foundation
import ArgumentParser

struct Add: ParsableCommand {
    static var configuration
    = CommandConfiguration(abstract: "Adds a custom keyword to the word bank.")
    
    @Option(name: .shortAndLong, help: "Adds a character to the character list")
    var character: String
    
    @Option(name: .shortAndLong, help: "Adds a scenario to the scenario list")
    var scenario: String
    
    @Option(name: .shortAndLong, help: "Adds a action to the action list")
    var action: String
    
    @Option(name: .shortAndLong, help: "Adds a descriptor to the descriptor list")
    var descriptor: String
    
    func run() throws {
        
        //loads json wordbank
        if var loadedBank = WordBank.loadBank() {
            
            //adds chosen words to bank
            loadedBank.characterBank.append(character)
            loadedBank.actionBank.append(action)
            loadedBank.scenarioBank.append(scenario)
            loadedBank.descriptorBank.append(descriptor)
            
            loadedBank.saveBank()
        }
        
        print("You have successfully added your words!")
        
        }
    }
