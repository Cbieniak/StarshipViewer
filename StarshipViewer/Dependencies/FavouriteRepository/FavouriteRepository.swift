//
//  FavouriteRepository.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation
import Observation

@Observable class FavouriteRepository {
  
  var favourites = Set<String>()
  
  func favourite(_ id: String) {
    favourites.insert(id)
  }
  
  func unfavourite(_ id: String) {
    favourites.remove(id)
  }
  
  func isFavourite(_ id: String) -> Bool {
    favourites.contains(id)
  }
  
  func toggleFavourite(_ id: String) {
    if isFavourite(id) {
      unfavourite(id)
    } else {
      favourite(id)
    }
  }
  
}

// TODO: Store


