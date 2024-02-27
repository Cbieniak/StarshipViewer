//
//  InMemoryStore.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation
import Observation

@Observable class InMemoryStore: Store {
  private var store = Set<String>()
  
  func insert(_ item: String) {
    store.insert(item)
  }
  
  func delete(_ item: String) {
    store.remove(item)
  }
  
  func contains(_ item: String) -> Bool {
    store.contains(item)
  }
}
