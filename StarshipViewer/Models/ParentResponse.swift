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
struct Starship: Codable {
  var name: String
  var model: String
  var manufacturer: String
}
