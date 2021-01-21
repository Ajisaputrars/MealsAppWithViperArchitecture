//
//  HomePresenter.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 22/01/21.
//

import UIKit

class HomePresenter {
  private let router = HomeRouter()
  private let homeUseCase: HomeUseCase
  var categories: [CategoryModel] = []
  var errorMessage = ""

  init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }
  
  func getCategories() {
    homeUseCase.getCategories { result in
      switch result {
      case .success(let categories):
        DispatchQueue.main.async {
          self.categories = categories
        }
      case .failure(let error):
        DispatchQueue.main.async {
          self.errorMessage = error.localizedDescription
        }
      }
    }
  }
  
  func goToDetailPage(from controller: UIViewController, withCategoryModel category: CategoryModel?){
    self.router.goToDetailPage(from: controller, withCategoryModel: category)
  }
}
