//
//  MockStarshipRepository.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation

class MockStarshipRepository: StarshipRepository {
  
  private(set) var state: StarshipState = .none
  
  init(mockState: StarshipState) {
    self.state = mockState
  }
  
  func setState(state: StarshipState) {
    self.state = state
  }
  
  func refresh() {}
  
  enum Error: LocalizedError {
    case placeholder
  }
}

