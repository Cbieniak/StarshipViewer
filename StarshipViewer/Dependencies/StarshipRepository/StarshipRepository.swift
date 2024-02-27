//
//  StarshipRepository.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 26/2/2024.
//

import Foundation
import Observation

enum StarshipState {
  case none
  case error(Error)
  case loading
  case loaded([Starship])
}

protocol StarshipRepository {
  
  var stateStream: AsyncStream<StarshipState> { get }
  
  func refresh()
}
