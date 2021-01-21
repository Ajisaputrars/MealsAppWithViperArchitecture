//
//  HomeRouter.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 22/01/21.
//

import UIKit

class HomeRouter {
  func goToDetailPage(from controller: UIViewController, withCategoryModel category: CategoryModel?){
    let detailPageController = DetailPageController()
    detailPageController.category = category
    controller.navigationController?.pushViewController(detailPageController, animated: true)
  }
}
