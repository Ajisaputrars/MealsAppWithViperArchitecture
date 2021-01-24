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
    self.homeUseCase.getCategories { result in
      DispatchQueue.main.async {
        switch result {
        case .success(let categories):
          self.categories = categories
        case .failure(let error):
          self.errorMessage = error.localizedDescription
        }
      }
    }
  }
  
  func goToDetailPage(from controller: UIViewController, withCategoryModel category: CategoryModel?){
    self.router.goToDetailPage(from: controller, withCategoryModel: category)
  }
}
