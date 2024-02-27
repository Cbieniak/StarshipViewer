//
//  Requesting.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 26/2/2024.
//

import Foundation

protocol Requesting {
  func request<T>(_ route: URLRequest, transformer: T) async throws -> T.Output where T: ResponseTransformer
}

protocol ResponseTransformer {
  associatedtype Output
  func transform(_ response: Result<Data, Error>) throws -> Output
}

// Note: In the future this would be generic to facilitate any kind of paged response
struct PagedResponseTransformer: ResponseTransformer {
  
  func transform(_ response: Result<Data, Error>) throws -> [Starship] {
    switch response {
      case .success(let data):
        let result = try JSONDecoder().decode(ParentResponse.self, from: data)
        return result.results
      case .failure(let error):
        throw error
    }
    
  }
}
