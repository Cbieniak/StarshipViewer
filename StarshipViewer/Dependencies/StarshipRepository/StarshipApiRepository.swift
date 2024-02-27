//
//  StarshipApiRepository.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation
import Observation

@Observable class StarshipApiRepository: StarshipRepository {
  
  var state: StarshipState = .none
  
  var api: Requesting
  
  init(api: Requesting) {
    self.api = api
  }

  func refresh() {
    state = .loading
    Task {
      do {
        let result = try await api.request(URLRequest(url: URL(string: "https://swapi.dev/api/starships/")!), transformer: PagedResponseTransformer())
        state = .loaded(result)
      } catch {
        state = .error(error)
      }
    }
  }
}
