//
//  Store.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation

// Would be a generic store in the future.
protocol Store {
  func insert(_ item: String)
  func delete(_ item: String)
  func contains(_ item: String) -> Bool
}
