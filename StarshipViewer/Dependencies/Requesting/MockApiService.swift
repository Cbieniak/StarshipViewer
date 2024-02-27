//
//  MockApiService.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation

struct MockApiService: Requesting {
  func request<T>(_ route: URLRequest, transformer: T) async throws -> T.Output where T : ResponseTransformer {
    try transformer.transform(.failure(Error.networkFailure))
  }
  
  enum Error: LocalizedError {
    case networkFailure
  }
}
