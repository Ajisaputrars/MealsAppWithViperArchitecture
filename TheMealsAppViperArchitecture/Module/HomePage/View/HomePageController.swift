//
//  ViewController.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 21/01/21.
//

import UIKit

class HomePageController: UIViewController {
  private lazy var homePageView = HomePageView(frame: self.view.frame)
  private var homePresenter: HomePresenter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = self.homePageView
    self.setupNavigationBar()
    
    self.homePresenter = HomePresenter(homeUseCase: Injection.init().provideHome())
    
    self.homePageView.mealTableView.delegate = self
    self.homePageView.mealTableView.dataSource = self
    
    self.homePresenter?.getCategories()
    
    DispatchQueue.global().async {
      Thread.sleep(forTimeInterval: 2)
      
      DispatchQueue.main.async {
        self.homePageView.mealTableView.reloadData()
      }
    }
  }
}

extension HomePageController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.homePresenter?.categories.count ?? 0

  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MealTableViewCell {
      cell.configureCell(category: self.homePresenter?.categories[indexPath.row])
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    self.homePresenter?.goToDetailPage(from: self, withCategoryModel: self.homePresenter?.categories[indexPath.row])
  }
}

extension HomePageController {
  private func setupNavigationBar(){
    self.title = "Meals App"
    let appearance = UINavigationBarAppearance()
    appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    appearance.backgroundColor = .red
    self.navigationController?.navigationBar.standardAppearance = appearance
    self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    self.navigationController?.navigationBar.prefersLargeTitles = false
    self.navigationController?.navigationBar.tintColor = .white
  }
}
