//
//  Starship.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation

struct Starship: Codable, Hashable, Identifiable {
  
  // No Id from the api. Use this in the mean time.
  var id: String {
    name
  }
  
  var name: String
  var model: String
  var manufacturer: String
  var starshipClass: String
  var hyperdriveRating: String
}
