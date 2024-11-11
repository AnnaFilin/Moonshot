//
//  FileManager-Documents.swift
//  Moonshot
//
//  Created by Anna Filin on 30/10/2024.
//

import Foundation

extension FileManager {
    
       func save<T: Codable>(_ data: T, to filename: String) {
           let url = URL.documentsDirectory.appendingPathComponent(filename)
           
           do {
               let encodedData = try JSONEncoder().encode(data)
               try encodedData.write(to: url, options: [.atomic, .completeFileProtection])
               print("Data saved in \(filename)")
           } catch {
               print("Can't save data: \(error.localizedDescription)")
           }
       }
    
      func load<T: Codable>(from filename: String, as type: T.Type) -> T? {
          let url = URL.documentsDirectory.appendingPathComponent(filename)
          
          do {
              let data = try Data(contentsOf: url)
              let decodedData = try JSONDecoder().decode(T.self, from: data)
              return decodedData
          } catch {
              print("Can't load data: \(error.localizedDescription)")
              return nil
          }
      }
}

