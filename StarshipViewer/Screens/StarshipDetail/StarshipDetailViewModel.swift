//
//  StarshipDetailViewModel.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation
import Observation

@Observable class StarshipDetailViewModel {
  var starship: Starship
  
  init(starship: Starship) {
    self.starship = starship
  }
  
  var attributes: [Attributes] {
    [
      Attributes(title: "Model", value: starship.model),
      Attributes(title: "Manufacturer", value: starship.manufacturer)
    ]
  }
  
  var title: String {
    starship.name
  }
}

struct Attributes: Hashable, Identifiable {
  var id: String {
    title
  }
  
  var title: String
  var value: String
}
