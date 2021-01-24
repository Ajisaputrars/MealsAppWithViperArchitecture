//
//  HomeInteractor.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 21/01/21.
//

import Foundation

protocol HomeUseCase {
  func getCategories(completion: @escaping (Result<[CategoryModel], Error>) -> Void)
}

class HomeInteractor: HomeUseCase {
  private let repository: MealRepositoryProtocol
  
  required init(repository: MealRepositoryProtocol) {
    self.repository = repository
  }
  
  func getCategories(completion: @escaping (Result<[CategoryModel], Error>) -> Void) {
    self.repository.getCategories { result in
      completion(result)
    }
  }
}
