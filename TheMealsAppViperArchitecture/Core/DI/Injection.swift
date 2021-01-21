//
//  Injection.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 21/01/21.
//

import Foundation

final class Injection {
  private func provideRepository() -> MealRepositoryProtocol {
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    return MealRepository.sharedInstance(remote)
  }

  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    return HomeInteractor(repository: repository)
  }

  func provideDetail(category: CategoryModel) -> DetailUseCase {
    let repository = provideRepository()
    return DetailInteractor(repository: repository, category: category)
  }
}
