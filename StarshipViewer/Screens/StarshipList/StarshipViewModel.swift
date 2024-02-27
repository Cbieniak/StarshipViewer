//
//  StarshipViewModel.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation
import Observation

@Observable class StarshipViewModel {
  
  var isSortMenuPresented: Bool = false
  
  var currentSortOrder: SortOrder = .api
  
  var isFiltered: Bool = false
  
  var starshipState: StarshipState {
    processState(starshipRepository.state)
  }
  
  var sortOptions: [SortOrder] {
    return [.api, .name]
  }
  
  private var starshipRepository: StarshipRepository
  
  private var favouriteRepository: FavouriteRepository
  
  init(repository: StarshipRepository, favouriteRepository: FavouriteRepository) {
    self.starshipRepository = repository
    self.favouriteRepository = favouriteRepository
  }
  
  // MARK: Lifecycle
  
  // Only refresh if the user has no data. We assume this api will not change very often.
  func appeared() {
    switch starshipState {
      case .none, .error:
        starshipRepository.refresh()
      default: break
    }
  }
  
  func refresh() {
    starshipRepository.refresh()
  }
  
  // MARK: State
  
  func processState(_ state: StarshipState) -> StarshipState {
    guard case let .loaded(array) = starshipRepository.state else {
      return starshipRepository.state
    }
    
    var filteredArray = array
    
    if isFiltered {
      filteredArray = array.filter { favouriteRepository.isFavourite($0.id) }
    }
    
    switch currentSortOrder {
      case .api:
        return .loaded(filteredArray)
      case .name:
        return .loaded(filteredArray.sorted(using: KeyPathComparator(\.name)))
    }
  }
  
  // MARK: Favourites
  
  func favouriteTapped(item: Starship) {
    favouriteRepository.toggleFavourite(item.id)
  }
  
  func favouriteButtonImage(item: Starship) -> String {
    if favouriteRepository.isFavourite(item.id) {
      "star.fill"
    } else {
      "star"
    }
  }
  
  // MARK: Sorting
  
  func sortTapped() {
    isSortMenuPresented = true
  }
  
  func sortBy(_ sortOrder: SortOrder) {
    currentSortOrder = sortOrder
  }
  
  func sortButtonImage(_ sortOrder: SortOrder) -> String? {
    if currentSortOrder == sortOrder {
      "checkmark.circle"
    } else {
      nil
    }
  }
  
  // MARK: Filter
  
  func filterTapped() {
    isFiltered.toggle()
  }
  
  func filterButtonImage() -> String {
    if isFiltered {
      "line.3.horizontal.decrease.circle.fill"
    } else {
      "line.3.horizontal.decrease.circle"
    }
  }
  
}

extension StarshipViewModel {
  enum SortOrder: Identifiable {
    case api
    case name
    
    var name: String {
      switch self {
        case .api:
          "Api"
        case .name:
          "Name"
      }
    }
    
    var id: String {
      name
    }
  }
}
