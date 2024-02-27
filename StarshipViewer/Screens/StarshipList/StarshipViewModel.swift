//
//  StarshipViewModel.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation
import Observation

@Observable class StarshipViewModel {
  
  enum StarshipState {
    case none
    case error(Error)
    case loading
    case loaded([Starship])
  }
  
  var starshipState: StarshipState = .none
  
  private var repository: StarshipRepository
  
  private var longLivedRepositoryTask: Task<Void, Never>?
  
  init(repository: StarshipRepository) {
    self.repository = repository
  }
  
  func appeared() {
    longLivedRepositoryTask = Task {
      for await val in repository.stateStream {
        switch val {
          case .none:
            self.starshipState = .none
          case .error(let error):
            self.starshipState = .error(error)
          case .loading:
            self.starshipState = .loading
          case .loaded(let array):
            self.starshipState = .loaded(array)
        }
      }
    }

    repository.refresh()
  }
  
}
