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
  fileprivate let locale: LocaleDataSource
  
  private init(locale: LocaleDataSource, remote: RemoteDataSource) {
    self.remote = remote
    self.locale = locale
  }
  
  static let shared = { localeRepo, remoteRepo in
    return MealRepository(locale: localeRepo, remote: remoteRepo)
  }
}

extension MealRepository: MealRepositoryProtocol {
  func getCategories(
    result: @escaping (Result<[CategoryModel], Error>) -> Void
  ) {
    self.locale.getCategories { localeResponses in
      switch localeResponses {
      case .success(let categoryEntity):
        let categoryList = CategoryMapper.mapCategoryEntitiesToDomains(input: categoryEntity)
        if categoryList.isEmpty {
          self.remote.getCategories { remoteResponses in
            DispatchQueue.main.async {
              switch remoteResponses {
              case .success(let categoryResponses):
                let categoryEntities = CategoryMapper.mapCategoryResponsesToEntities(input: categoryResponses)
                self.locale.addCategories(from: categoryEntities) { addState in
                  switch addState {
                  case .success(let resultFromAdd):
                    if resultFromAdd {
                      self.locale.getCategories { localeResponses in
                        switch localeResponses {
                        case .success(let categoryEntity):
                          let resultList = CategoryMapper.mapCategoryEntitiesToDomains(input: categoryEntity)
                          result(.success(resultList))
                        case .failure(let error):
                          result(.failure(error))
                        }
                      }
                    }
                  case .failure(let error):
                    result(.failure(error))
                  }
                }
              case .failure(let error):
                result(.failure(error))
              }
            }
          }
        } else {
          result(.success(categoryList))
        }
      case .failure(let error):
        result(.failure(error))
      }
    }
  }
}
