//
//  FavouriteRepository.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation
import Observation

@Observable class FavouriteRepository {
    
  var store: Store
  
  init(store: Store) {
    self.store = store
  }
  
  func favourite(_ id: String) {
    store.insert(id)
  }
  
  func unfavourite(_ id: String) {
    store.delete(id)
  }
  
  func isFavourite(_ id: String) -> Bool {
    store.contains(id)
  }
  
  func toggleFavourite(_ id: String) {
    if isFavourite(id) {
      unfavourite(id)
    } else {
      favourite(id)
    }
  }
  
}
