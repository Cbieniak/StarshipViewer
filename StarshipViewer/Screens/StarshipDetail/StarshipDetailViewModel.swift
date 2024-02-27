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
  
  var favouriteRepository: FavouriteRepository
  
  init(starship: Starship, favouriteRepository: FavouriteRepository) {
    self.starship = starship
    self.favouriteRepository = favouriteRepository
  }
  
  var attributes: [Attributes] {
    [
      Attributes(title: "Model", value: starship.model),
      Attributes(title: "Manufacturer", value: starship.manufacturer),
      Attributes(title: "Starship Class", value: starship.starshipClass),
      Attributes(title: "Hyperdrive Rating", value: starship.hyperdriveRating)
    ]
  }
  
  var title: String {
    starship.name
  }
  
  func favouriteTapped() {
    favouriteRepository.toggleFavourite(starship.id)
  }
  
  func favouriteBarButtonImage() -> String {
    if favouriteRepository.isFavourite(starship.id) {
      "star.fill"
    } else {
      "star"
    }
  }
}

struct Attributes: Hashable, Identifiable {
  var id: String {
    title
  }
  
  var title: String
  var value: String
}
