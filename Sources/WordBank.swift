//
//  File.swift
//
//
//  Created by Felipe on 13/03/24.
//

import Foundation

struct WordBank: Codable {
    
    var characterBank: [String] = [
        "pirate", "horse", "princess", "fairy", "knight", "wizard", "mermaid", "unicorn", "explorer", "inventor", "baker", "gardener", "firefighter", "teacher", "dragon"
    ]
    var descriptorBank: [String] = [
        "lost", "happy", "hungry", "lonely", "brave", "curious", "kind", "silly", "helpful", "adventurous", "playful", "determined", "clever", "friendly"]
    var actionBank: [String] = [
        "fighting", "running", "dancing", "reading", "skipping", "giggling", "exploring", "climbing", "helping", "singing", "whispering", "building", "dreaming", "painting"]
    var scenarioBank: [String] = [
        "farm", "castle", "meadow", "island", "forest", "cottage", "beach", "kingdom", "marketplace", "sea", "hills", "cave", "treehouse", "sky", "volcano", "ship"]
    
    //writing the word bank in a json file
    func saveBank() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                
                let fileURL = documentDirectory.appendingPathComponent("data.json")
                try data.write(to: fileURL)
            }
            
        } catch {
            print("error saving")
        }
    }
    
    //loading the json file back into swift
    static func loadBank() -> WordBank? {
        do {
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent("data.json")
                
                //checks if theres json yet
                if FileManager.default.fileExists(atPath: fileURL.path) {
                    //translates json to struct
                    let data = try Data(contentsOf: fileURL)
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(WordBank.self, from: data)
                    return model
                } else {
                    //created json if there isnt any
                    let defaultWordBank = WordBank()
                    defaultWordBank.saveBank()
                    return defaultWordBank
                }
            }
        } catch {
            print("error loading")
        }
        return nil
    }
}
