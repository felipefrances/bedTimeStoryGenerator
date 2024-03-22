//
//  File.swift
//
//
//  Created by Felipe on 13/03/24.
//

import Foundation

struct WordBank: Codable {
    
    var characterBank: [String] = []
    var descriptorBank: [String] = []
    var actionBank: [String] = []
    var scenarioBank: [String] = []
    
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
            print("Error")
        }
    }
    
    //loading the json file back into swift
    static func loadBank() -> WordBank? {
        do {
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent("data.json")
                let data = try Data(contentsOf: fileURL)
                
                let decoder = JSONDecoder()
                let model = try decoder.decode(WordBank.self, from: data)
                return model
            }
        } catch {
            print("error")
        }
        return nil
    }
}
