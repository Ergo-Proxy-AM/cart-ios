//
//  CodableBundleExtension.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [Item] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([Item].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
