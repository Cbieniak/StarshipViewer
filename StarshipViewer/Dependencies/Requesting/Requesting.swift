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
