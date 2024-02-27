//
//  StarshipDetailScreen.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation
import SwiftUI

struct StarshipDetailScreen: View {
  
  var viewModel: StarshipDetailViewModel
  
  var body: some View {
    VStack {
      List(viewModel.attributes) { attribute in
        HStack {
          Text(attribute.title)
          Spacer()
          Text(attribute.value)
        }
      }
    }
    .navigationTitle(viewModel.title)
    .toolbar {
      Button("", systemImage: viewModel.favouriteBarButtonImage()) {
        viewModel.favouriteTapped()
      }
      .animation(.default, value: viewModel.favouriteBarButtonImage())
    }
  }
}

#Preview {
  NavigationStack {
    StarshipDetailScreen(viewModel: .init(starship: .init(name: "name", model: "Model", manufacturer: "Manu", url: "url"), favouriteRepository: .init(store: InMemoryStore())))
  }
}
