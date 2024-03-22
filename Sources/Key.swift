//
//  File.swift
//  
//
//  Created by Felipe on 13/03/24.
//

import Foundation

enum APIKey {
// fetch the API key from `GenerativeAI-Info.plist` (hardcoded path)
    static var `default`: String {
        let filePath = "/Users/felipe/Desktop/teste/teste/GenerativeAI-Info.plist"
        guard let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Couldn't find file 'GenerativeAI-Info'.")
        }
        guard let value = plist.object(forKey: "APIKey") as? String else {
            fatalError("Couldn't find key 'APIKey' in 'GenerativeAI-Info.plist'.")
        }
        if value.starts(with: "_") {
            fatalError(
                "Follow the instructions at https://ai.google.dev/tutorials/setup to get an API key."
            )
        }
        return value
    }
}
