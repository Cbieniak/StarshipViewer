//
//  ParentResponse.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 26/2/2024.
//

import Foundation

struct ParentResponse: Codable {
  var results: [Starship]
}

// Note: Don't map more attributes than we intend to show to retain flexibility in the api.
struct Starship: Codable, Identifiable {
  
  // No Id from the api. Use this in the mean time.
  var id: String {
    name
  }
  
  var name: String
  var model: String
  var manufacturer: String
  
  var url: String
}

extension Starship {
  var unwrappedUrl: URL? {
    URL(string: url)
  }
}
