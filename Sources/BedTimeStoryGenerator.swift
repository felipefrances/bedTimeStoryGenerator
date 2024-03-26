// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import Foundation
import ArgumentParser
import GoogleGenerativeAI

@main
struct Bedtime: AsyncParsableCommand {
    
    static var configuration = CommandConfiguration(


        abstract: "Bedtime Story Generator",
        discussion: """
         _____                                                          _____
        ( ___ )--------------------------------------------------------( ___ )
         |   |                                                          |   |
         |   |   ,-----.            ,--.  ,--.  ,--.                    |   |
         |   |   |  |) /_  ,---.  ,-|  |,-'  '-.`--',--,--,--. ,---.    |   |
         |   |   |  .-.  \\| .-. :' .-. |'-.  .-',--.|        || .-. :   |   |
         |   |   |  '--' /\\   --.\\ `-' |  |  |  |  ||  |  |  |\\   --.   |   |
         |   |   `------'  `----' `---'   `--'  `--'`--`--`--' `----'   |   |
         |   |    ,---.   ,--.                                          |   |
         |   |   '   .-',-'  '-. ,---. ,--.--.,--. ,--.                 |   |
         |   |   `.  `-.'-.  .-'| .-. ||  .--' \\  '  /                  |   |
         |   |   .-'    | |  |  ' '-' '|  |     \\   '                   |   |
         |   |   `-----'  `--'   `---' `--'   .-'  /                    |   |
         |   |                                `---'                     |   |
         |___|                                                          |___|
        (_____)--------------------------------------------------------(_____)
        
        This tool is intended to help parents and guardians think up story or story ideas for children. You can request a prompt from previously loaded up keywords, an entire story or even feed your own keywords to the word bank - be they a descriptor, a character, a scenario, an action. This is meant to make it easier for guardians to make original stories each night with the possibility of incorporating the child's favorite characters and environments.
        """,
        subcommands: [Add.self, Story.self, Prompt.self, List.self, Remove.self]
    )
}

//function to help with verbose
func writeExplanation(condition: Bool) {
    if condition {
        let explanationText = ["Choosing an incredible description...", "Generating a wonderful character...", "Picking an exciting action...", "Thinking about an amazing scenario...", "Ok, here it comes..."]
        let colors = [Colors.blue, Colors.cyan, Colors.red, Colors.magenta, Colors.yellow]
        let chosenColor = colors.randomElement()
        
        for phrase in explanationText {
            printColor(color: chosenColor ?? colors[0], text: phrase)
            sleep(1)
        }
    }
}
