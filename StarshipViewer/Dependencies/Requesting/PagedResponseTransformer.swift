//
//  PagedResponseTransformer.swift
//  StarshipViewer
//
//  Created by ChristianBieniak on 27/2/2024.
//

import Foundation

// Maps a paged response to into model objects we intend to work with
// Note: In the future this would be generic to facilitate any kind of paged response
struct PagedResponseTransformer: ResponseTransformer {
  
  func transform(_ response: Result<Data, Error>) throws -> [Starship] {
    switch response {
      case .success(let data):
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try jsonDecoder.decode(ParentResponse.self, from: data)
        return result.results
      case .failure(let error):
        throw error
    }
    
  }
}
