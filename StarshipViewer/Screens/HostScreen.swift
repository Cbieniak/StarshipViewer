//
//  HostScreen.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 26/2/2024.
//

import SwiftUI

struct HostScreen: View {
  @State private var navigator = Navigator()
  var body: some View {
    NavigationStack(path: $navigator.path) {
      StarshipListScreen(viewModel: .init(repository: StarshipApiRepository(api: MockApiService())))
        .navigationDestination(for: Screen.self) { destination in
          switch destination {
            case .starships:
              EmptyView()
            case .starship(id: _):
              EmptyView()
          }
        }
    }
    .environment(navigator)
  }
}

#Preview {
  HostScreen()
    .environment(Navigator())
}
