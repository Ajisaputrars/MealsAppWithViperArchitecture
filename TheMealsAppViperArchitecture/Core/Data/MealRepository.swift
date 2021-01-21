//
//  MealRepository.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 21/01/21.
//

import Foundation

protocol MealRepositoryProtocol {
  func getCategories(result: @escaping (Result<[CategoryModel], Error>) -> Void)
}

final class MealRepository {
  typealias MealInstance = (RemoteDataSource) -> MealRepository
  fileprivate let remote: RemoteDataSource

  private init(remote: RemoteDataSource) {
    self.remote = remote
  }

  static let sharedInstance: MealInstance = { remoteRepo in
    return MealRepository(remote: remoteRepo)
  }
}

extension MealRepository: MealRepositoryProtocol {
  func getCategories(
    result: @escaping (Result<[CategoryModel], Error>) -> Void
  ) {

    self.remote.getCategories { remoteResponses in
      switch remoteResponses {
      case .success(let categoryResponses):
        let resultList = CategoryMapper.mapCategoryResponsesToDomains(input: categoryResponses)
        result(.success(resultList))
      case .failure(let error):
        result(.failure(error))
      }
    }
  }
}