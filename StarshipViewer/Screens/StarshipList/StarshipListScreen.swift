//
//  StarshipListView.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 26/2/2024.
//

import Foundation
import SwiftUI

struct StarshipListScreen: View {
  
  @State var viewModel: StarshipViewModel
  
  var body: some View {
    VStack {
      switch viewModel.starshipState {
        case .none:
          EmptyView()
        case .error(let error):
          errorView(error)
        case .loading:
          ProgressView()
        case .loaded(let starships):
          contentView(starships)
      }
    }
    .onAppear {
      viewModel.appeared()
    }.toolbar {
      makeToolbarContent()
    }.navigationTitle("Starship Viewer")
  }
  
  @ViewBuilder
  func errorView(_ error: Error) -> some View {
    ContentUnavailableView(error.localizedDescription, systemImage: "exclamationmark.triangle")
  }
  
  @ViewBuilder
  func contentView(_ starships: [Starship]) -> some View {
    if starships.count == 0 {
      ContentUnavailableView("No Ships", systemImage: "space")
    } else {
      List {
        ForEach(starships) { item in
          makeRowContent(item)
        }
      }
      .refreshable {
        // Currently causes a UI Glitch, Need to extract loading presentation logic from retrival logic.
        viewModel.refresh()
      }
      .animation(.default, value: starships)
    }
  }
  
  @ViewBuilder
  func makeRowContent(_ item: Starship) -> some View {
    HStack {
      // Also need to add favouriting as a accessibilityAction
      Image(systemName: viewModel.favouriteButtonImage(item: item))
        .onTapGesture {
          viewModel.favouriteTapped(item: item)
        }
        .foregroundStyle(.blue)
        .animation(.default, value: viewModel.favouriteButtonImage(item: item))
      
      NavigationLink(value: Screen.starship(starship: item)) {
        VStack(alignment: .leading) {
          Text(item.name)
            .font(.headline)
          Text(item.model)
            .font(.body)
          Text(item.hyperdriveRating)
            .font(.subheadline)
            .foregroundStyle(Color.gray)
        }
      }
    }
  }
  
  @ViewBuilder
  func makeToolbarContent() -> some View {
    Button(action: {
      viewModel.sortTapped()
    }, label: {
      Image(systemName: "arrow.up.and.down.circle")
    })
    .popover(isPresented: $viewModel.isSortMenuPresented, content: {
      makePopoverContent()
    })
    
    Button(action: {
      viewModel.filterTapped()
    }, label: {
      Image(systemName: viewModel.filterButtonImage())
    })
  }
  
  @ViewBuilder
  func makePopoverContent() -> some View {
    VStack(alignment: .leading) {
      ForEach(viewModel.sortOptions) { sortOption in
        Button(action: {
          viewModel.sortBy(sortOption)
        }, label: {
          HStack {
            if let image = viewModel.sortButtonImage(sortOption) {
              Image(systemName: image)
            } else {
              Spacer(minLength: 32)
            }
            Text(sortOption.name)
            Spacer()
          }
        })
      }
    }
    .padding()
    .presentationCompactAdaptation(.popover)
  }
}

#Preview("Loading") {
  StarshipListScreen(viewModel: .init(repository: MockStarshipRepository(mockState: .loading), favouriteRepository: .init(store: InMemoryStore())))
}

#Preview("Error") {
  StarshipListScreen(viewModel: .init(repository: MockStarshipRepository(mockState: .error(MockStarshipRepository.Error.placeholder)), favouriteRepository: .init(store: InMemoryStore())))
}

#Preview("Content") {
  NavigationStack {
    StarshipListScreen(viewModel: .init(repository: MockStarshipRepository(mockState: .loaded([.mock()])), favouriteRepository: .init(store: InMemoryStore())))
  }
}
