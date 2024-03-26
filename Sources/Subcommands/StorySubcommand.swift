//
//  File.swift
//
//
//  Created by Felipe on 15/03/24.
//

import Foundation
import ArgumentParser
import GoogleGenerativeAI
import AVFoundation

struct Story: AsyncParsableCommand {
    static var configuration
    = CommandConfiguration(abstract: "Randomly generates a complete story.")
    
    //story length options
    enum Length: String, ExpressibleByArgument, CaseIterable {
        case short
        case medium
        case long
    }
    
    //story age options
    enum Age: String, ExpressibleByArgument, CaseIterable {
        case toddler
        case preschooler
        case schooler
    }
    
    //var to help with instructions func
    var lengthCount: String {
        switch length {
        case .short:
            return "100-150"
        case .medium:
            return "150-200"
        case .long:
            return "200-300"
        default:
            return "150"
        }
    }
    
    @Flag(name: .shortAndLong, help: "Show the generating process")
    var verbose = false
    
    @Option(name: .shortAndLong, help: "Choose your story length")
    var length: Length?
    
    @Option(name: .shortAndLong, help: "Choose if your child is a toddler (0-3), a preschooler (4-6) or a kid (7-10+)")
    var age: Age?
        
    func run() async throws {
        
        //loads json wordbank
        if let loadedBank = WordBank.loadBank() {
            
        //shuffles and chooses random words
        let chosenCharacter = loadedBank.characterBank.randomElement()
        let chosenDescriptor = loadedBank.descriptorBank.randomElement()
        let chosenAction = loadedBank.actionBank.randomElement()
        let chosenScenario = loadedBank.scenarioBank.randomElement()
        
        //ascii image
        printColor(color: Colors.red, text: book)
        
        //explains the process if verbose
        writeExplanation(condition: verbose)
        
        let prompt = "A \(chosenDescriptor ?? "happy") \(chosenCharacter ?? "child") \(chosenAction ?? "playing") in a \(chosenScenario ?? "field")"
        
            let story: String = instructions(prompt)
        
        //calls gemini api
        let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
        let response = try await model.generateContent(story)
            if let text = response.text {
                print("Once upon a time there was:")
                print(chosenAction!, chosenScenario!, chosenCharacter!, chosenDescriptor!)
                print(text)
            }
        }
    }
    
    //prompts to feed gemini based on age and length chosen
    func instructions(_ prompt: String) -> String {
        switch age {
        case .toddler:
            return "Create a relaxing story about \(prompt). The story should have from \(lengthCount) words, simple and repetitive language, with short sentences and onomatopoeias. The focus should be on sounds, colors, and textures, with familiar characters and everyday situations. The story should be suitable for children aged 1-3 years old and aim to create a calming and relaxing sensory experience for bedtime. Onomatopoeias should be scattered throughout the story in a creative manner, without always being at the beginning of the paragraph. The story should contain a positive lesson for the child."
        case .preschooler:
            return "Create a \(lengthCount) word story about \(prompt). The story should have a simple plot and feature fantastical characters and talking animals. The story should be fun and exciting, with moral lessons about friendship, cooperation, and bravery. It should be suitable for children aged 4-6 years old and aim to stimulate imagination and language development"
        case .schooler:
            return "Create a \(lengthCount) word and elaborate story with an intriguing plot and suspense. The story can explore themes like science fiction, fantasy, or mystery, using \(prompt). Characters should be complex and face moral dilemmas. The story should be thrilling and thought-provoking, with a surprising ending. It should be suitable for children aged 7-10 years old and aim to stimulate creativity and reflection on life."
        default:
            return defaultInstructions(prompt)
            
        }
    }
    
    //prompts to feed gemini if there arent any age and length chosen
    func defaultInstructions(_ prompt: String) -> String {
        switch length {
        case .short:
            return "Write up to a 100 word bedtime story about a \(prompt) for a child."
        case .medium:
            return "Write a 150-200 word bedtime story about a \(prompt) for a child named."
        case .long:
            return "Write a 250-300 word bedtime story about a \(prompt) for a child."
        default:
            return "Write a elaborate word bedtime story about a \(prompt) for a child named."
        }
    }
    
}
