//
//  StarshipViewModel.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation
import Observation

@Observable class StarshipViewModel {
  
  var starshipState: StarshipState {
    starshipRepository.state
  }
  
  private var starshipRepository: StarshipRepository
  
  private var favouriteRepository: FavouriteRepository
  
  init(repository: StarshipRepository, favouriteRepository: FavouriteRepository) {
    self.starshipRepository = repository
    self.favouriteRepository = favouriteRepository
  }
  
  func appeared() {
    starshipRepository.refresh()
  }
  
  func favouriteTapped(item: Starship) {
    favouriteRepository.toggleFavourite(item.id)
  }
  
  func favouriteButtonImage(item: Starship) -> String {
    if favouriteRepository.isFavourite(item.id) {
      "star.fill"
    } else {
      "star"
    }
  }
}
