//
//  ApiService.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 26/2/2024.
//

import Foundation

struct ApiService: Requesting {
  func request<T>(_ route: URLRequest, transformer: T) async throws -> T.Output where T : ResponseTransformer {
    var result: Result<Data, Error>
    do {
      // In the future inject `URLSession.shared` rather than use the singleton
      let response = try await URLSession.shared.data(for: route)
      result = .success(response.0)
    } catch {
      // Allow catching here to be transformed in the case of recoverable errors.
      result = .failure(error)
    }
    
    // Try here refers to errors that have occurred during transformation.
    return try transformer.transform(result)
  }
}
