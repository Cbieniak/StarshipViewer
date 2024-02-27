//
//  ParentResponse.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 26/2/2024.
//

import Foundation

// Only map whats required for the starship
// In the future will be required for pagination
struct ParentResponse: Codable {
  var results: [Starship]
}
