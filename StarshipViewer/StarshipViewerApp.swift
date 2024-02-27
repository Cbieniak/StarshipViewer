//
//  StarshipViewerApp.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 26/2/2024.
//

import SwiftUI
import SwiftData

@main
struct StarshipViewerApp: App {
  
  var requesting: Requesting
  
  var starshipRepository: StarshipRepository
  
  var favouritesRepository = FavouriteRepository(store: InMemoryStore())
  
  var navigator = Navigator()
  
  init() {
    requesting = ApiService()
    starshipRepository = StarshipApiRepository(api: requesting)
  }
  
  var body: some Scene {
    WindowGroup {
      HostScreen()
    }
    .environment(\.starshipRepository, starshipRepository)
    .environment(navigator)
    .environment(favouritesRepository)
  }
}

extension EnvironmentValues {
  var starshipRepository: StarshipRepository {
    get { self[StarshipRepositoryKey.self] }
    set { self[StarshipRepositoryKey.self] = newValue }
  }
}

private struct StarshipRepositoryKey: EnvironmentKey {
  static let defaultValue: StarshipRepository = MockStarshipRepository(mockState: .loading)
}
