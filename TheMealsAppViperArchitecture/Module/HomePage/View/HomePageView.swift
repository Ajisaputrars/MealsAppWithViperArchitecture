//
//  HomePageView.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 21/01/21.
//

import UIKit

class HomePageView: UIView {
  
  let mealTableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .clear
    tableView.register(MealTableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    self.backgroundColor = .white
    
    self.addSubview(self.mealTableView)
    self.mealTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
    self.mealTableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
    self.mealTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    self.mealTableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
    
    self.mealTableView.rowHeight = self.frame.size.height / 2.3
  }
}
