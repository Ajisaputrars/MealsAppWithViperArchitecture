//
//  RemoteDataSource.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 21/01/21.
//

import Foundation

protocol RemoteDataSourceProtocol: class {
  func getCategories(result: @escaping (Result<[CategoryResponse], URLError>) -> Void)
}

final class RemoteDataSource: NSObject {
  private override init() { }
  static let sharedInstance: RemoteDataSource =  RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  func getCategories(result: @escaping (Result<[CategoryResponse], URLError>) -> Void) {
    guard let url = URL(string: Endpoints.Gets.categories.url) else { return }
    
    URLSession.shared.dataTask(with: url) { maybeData, maybeResponse, maybeError in
      if maybeError != nil {
        result(.failure(.addressUnreachable(url)))
      } else if
        let data = maybeData, let response = maybeResponse as? HTTPURLResponse, response.statusCode == 200 {
        let decoder = JSONDecoder()
        do {
          let categories = try decoder.decode(CategoriesResponse.self, from: data).categories
          result(.success(categories))
        } catch {
          result(.failure(.invalidResponse))
        }
      }
    }.resume()
  }
}
