//
//  MockStarshipRepository.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation

class MockStarshipRepository: StarshipRepository {
  
  var stateStream: AsyncStream<StarshipState>
  
  var mockState: StarshipState = .none
  
  private var continuation: AsyncStream<StarshipState>.Continuation
  
  init(mockState: StarshipState) {
    self.mockState = mockState
    let (stream, continuation) = AsyncStream<StarshipState>.makeStream()
    self.stateStream = stream
    self.continuation = continuation
  }
  
  func refresh() {
    continuation.yield(mockState)
  }
}
