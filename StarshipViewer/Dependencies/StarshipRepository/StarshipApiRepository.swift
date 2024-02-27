//
//  StarshipApiRepository.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation

class StarshipApiRepository: StarshipRepository {
  
  var stateStream: AsyncStream<StarshipState>
  
  private var continuation: AsyncStream<StarshipState>.Continuation
  
  private var api: Requesting
  
  init(api: Requesting) {
    self.api = api
    let (stream, continuation) = AsyncStream<StarshipState>.makeStream()
    self.stateStream = stream
    self.continuation = continuation
  }

  func refresh() {
    continuation.yield(.loading)
    Task {
      do {
        let result = try await api.request(URLRequest(url: URL(string: "https://swapi.dev/api/starships/")!), transformer: PagedResponseTransformer())
        continuation.yield(.loaded(result))
      } catch {
        continuation.yield(.error(error))
      }
    }
  }
}
