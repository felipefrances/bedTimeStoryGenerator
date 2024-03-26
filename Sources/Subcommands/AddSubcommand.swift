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
    var character: String?
    
    @Option(name: .shortAndLong, help: "Adds a scenario to the scenario list")
    var scenario: String?
    
    @Option(name: .shortAndLong, help: "Adds a action to the action list")
    var action: String?
    
    @Option(name: .shortAndLong, help: "Adds a descriptor to the descriptor list")
    var descriptor: String?
    
    func run() throws {
        
        //loads json wordbank
        if var loadedBank = WordBank.loadBank() {
            
            //adds chosen words to bank
            if let character = character {
                loadedBank.characterBank.append(character.lowercased())
            }
            
            //removes scenario by name if user chooses any
            if let scenario = scenario {
                loadedBank.scenarioBank.append(scenario.lowercased())
            }
            //removes action by name if user chooses any
            if let action = action {
                loadedBank.actionBank.append(action.lowercased())
            }
            //removes description by name if user chooses any
            if let descriptor = descriptor {
                loadedBank.descriptorBank.append(descriptor.lowercased())
            }
            
        
            loadedBank.saveBank()
        }
        
        print("You have successfully added your words!")
        
        }
    }
