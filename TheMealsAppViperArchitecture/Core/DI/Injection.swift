//
//  Injection.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 21/01/21.
//

import Foundation
import RealmSwift

final class Injection {
  private func provideRepository() -> MealRepositoryProtocol {
    let realm = try? Realm()
    let locale = LocaleDataSource.sharedInstance(realm)
    let remote = RemoteDataSource.sharedInstance
    return MealRepository.shared(locale, remote)
  }
  
  func provideHomeUseCase() -> HomeUseCase {
    let repository = self.provideRepository()
    return HomeInteractor(repository: repository)
  }

  func provideDetailUseCase(category: CategoryModel) -> DetailUseCase {
    let repository = self.provideRepository()
    return DetailInteractor(repository: repository, category: category)
  }
}
