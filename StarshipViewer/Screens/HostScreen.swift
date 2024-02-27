//
//  HostScreen.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 26/2/2024.
//

import SwiftUI

struct HostScreen: View {
  @State private var navigator = Navigator()
  @Environment(\.starshipRepository) private var starshipRepository
  @Environment(FavouriteRepository.self) private var favouritesRepository
  
  var body: some View {
    NavigationStack(path: $navigator.path) {
      StarshipListScreen(viewModel: .init(repository: starshipRepository, favouriteRepository: favouritesRepository))
        .navigationDestination(for: Screen.self) { destination in
          switch destination {
            case .starships:
              EmptyView()
            case .starship(let starship):
              StarshipDetailScreen(viewModel: .init(starship: starship, favouriteRepository: favouritesRepository))
          }
        }
    }
    .environment(navigator)
  }
}

#Preview {
  HostScreen()
    .environment(Navigator())
    .environment(\.starshipRepository, MockStarshipRepository(mockState: .loading))
    .environment(FavouriteRepository(store: InMemoryStore()))
}
