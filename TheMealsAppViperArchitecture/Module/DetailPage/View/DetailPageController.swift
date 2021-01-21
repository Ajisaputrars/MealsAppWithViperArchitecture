//
//  DetailPageController.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 22/01/21.
//

import UIKit

class DetailPageController: UIViewController {
  
  var category: CategoryModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .green
    
    self.setupNavigationBar()
  }
}

extension DetailPageController {
  private func setupNavigationBar(){
    self.title = self.category?.title
    self.navigationItem.largeTitleDisplayMode = .never
  }
}
