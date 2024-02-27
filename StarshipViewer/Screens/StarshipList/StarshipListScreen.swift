//
//  StarshipListView.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 26/2/2024.
//

import Foundation
import SwiftUI

struct StarshipListScreen: View {
  
  @Environment(Navigator.self) private var navigator
  
  @State var viewModel: StarshipViewModel
  
  var body: some View {
    VStack {
      switch viewModel.starshipState {
        case .none:
          EmptyView()
        case .error(let error):
          ContentUnavailableView(error.localizedDescription, systemImage: "exclamationmark.triangle")
        case .loading:
          ProgressView()
        case .loaded(let starships):
          List {
            ForEach(starships) { item in
              HStack {
                Button("", systemImage: viewModel.isFavourite(item: item) ? "star.fill" : "star") {
                  viewModel.toggleFavourite(item: item)
                }
                Text(item.name)
                  .frame(maxWidth: .infinity)
                  .onTapGesture {
                    navigator.navigateToScreen(.starship(starship: item))
                  }
              }
            }
          }
      }
    }.onAppear {
      viewModel.appeared()
    }
  }
}

#Preview("Loading") {
  StarshipListScreen(viewModel: .init(repository: MockStarshipRepository(mockState: .loading), favouriteRepository: .init()))
    .environment(Navigator())
    .environment(\.starshipRepository, MockStarshipRepository(mockState: .loading))
    .environment(FavouriteRepository())
}

#Preview("Error") {
  StarshipListScreen(viewModel: .init(repository: MockStarshipRepository(mockState: .error(MockApiService.Error.networkFailure)), favouriteRepository: .init()))
    .environment(Navigator())
}

#Preview("Content") {
  StarshipListScreen(viewModel: .init(repository: MockStarshipRepository(mockState: .loaded([.init(name: "Ship", model: "Model", manufacturer: "Manufacturer", url: "www.nextship.com")])), favouriteRepository: .init()))
    .environment(Navigator())
}
