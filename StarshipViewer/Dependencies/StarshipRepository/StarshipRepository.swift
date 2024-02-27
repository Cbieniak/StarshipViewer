//
//  StarshipRepository.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 26/2/2024.
//

import Foundation
import Observation

enum StarshipState: Equatable {
  case none
  case error(Error)
  case loading
  case loaded([Starship])
  
  static func == (lhs: StarshipState, rhs: StarshipState) -> Bool {
    switch (lhs, rhs) {
      case (.none, .none), (.error, .error), (.loading, .loading):
        return true
      case let (.loaded(lhsArray), .loaded(rhsArray)):
        return lhsArray == rhsArray
      default:
        return false
    }
  }
}

protocol StarshipRepository {
  
  var state: StarshipState { get }
  
  func refresh()
}
