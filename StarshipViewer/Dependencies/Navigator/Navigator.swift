//
//  Navigator.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 26/2/2024.
//

import Observation

@Observable class Navigator {
  
  var path: [Screen] = []
  
  func navigateToScreen(_ screen: Screen) {
    path.append(screen)
  }
}

