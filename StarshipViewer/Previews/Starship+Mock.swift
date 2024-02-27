//
//  Starship+Mock.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation

extension Starship {
  static func mock(name: String = "Tie Fighter") -> Self {
    .init(
      name: name,
      model: "Old",
      manufacturer: "Empire",
      starshipClass: "Corvette",
      hyperdriveRating: "20"
    )
  }
}
