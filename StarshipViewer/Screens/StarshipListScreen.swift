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
  
  var body: some View {
    Text("list")
    Button("Select Ship") {
      navigator.navigateToScreen(.starship(id: "temp"))
    }
  }
}

#Preview {
  StarshipListScreen()
    .environment(Navigator())
}
