//
//  StarshipListScreenTests.swift
//  StarshipViewerTests
//
//  Created by ChristianBieniak on 27/2/2024.
//

import XCTest
@testable import StarshipViewer

// Two example tests here testing logic with the Viewmodel.
// All logic within the viewmodel should be tested to ensure that regressions do not occur.
// Additionally all dependencies should be tested as these represent core reused functionality within the app.
final class StarshipListScreenTests: XCTestCase {
  
  func testFilteringFavourites() throws {
    // Arrange
    let models = [Starship.mock(name: "a"), Starship.mock(name: "b"), Starship.mock(name: "c")]
    let store = InMemoryStore()
    let viewmodel = StarshipViewModel(repository: MockStarshipRepository(mockState: .loaded(models)), favouriteRepository: .init(store: store))
    store.insert("a")
    
    // Act
    viewmodel.filterTapped()
    
    // Assert
    XCTAssertEqual(viewmodel.starshipState, .loaded([Starship.mock(name: "a")]))
  }
  
  func testOrderingByName() throws {
    // Arrange
    let models = [Starship.mock(name: "c"), Starship.mock(name: "b"), Starship.mock(name: "a")]
    let viewmodel = StarshipViewModel(repository: MockStarshipRepository(mockState: .loaded(models)), favouriteRepository: .init(store: InMemoryStore()))
    
    // Act
    viewmodel.sortBy(.name)
    
    // Assert
    XCTAssertEqual(viewmodel.starshipState, .loaded([Starship.mock(name: "a"), Starship.mock(name: "b"), Starship.mock(name: "c")]))
  }
  
}
