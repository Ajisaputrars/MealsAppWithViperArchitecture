//
//  MealTableViewCell.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 21/01/21.
//

import UIKit
import SDWebImage

class MealTableViewCell: UITableViewCell {
  
  let containerView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.random
    view.layer.cornerRadius = 10
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let mealImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let mealTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Test"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let mealDescriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "Test"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.setupView()
  }
  
  override func setHighlighted(_ highlighted: Bool, animated: Bool) {
    if highlighted {
      self.containerView.alpha = 0.8
    } else {
      UIView.animate(withDuration: 0.5) {
        self.containerView.alpha = 1.0
      }
    }
  }
  
  func configureCell(category: CategoryModel?) {
    self.mealTitleLabel.text = category?.title ?? "No Title"
    self.mealDescriptionLabel.text = category?.description ?? "No Description"
    self.mealImageView.sd_setImage(with: URL(string: category?.image ?? ""))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView(){
    
    self.addSubview(self.containerView)
    self.containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
    self.containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
    self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
    self.containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
    
    self.containerView.addSubview(self.mealImageView)
    self.mealImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 0).isActive = true
    self.mealImageView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 0).isActive = true
    self.mealImageView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: 0).isActive = true
    
    self.containerView.addSubview(self.mealTitleLabel)
    self.mealTitleLabel.topAnchor.constraint(equalTo: self.mealImageView.bottomAnchor, constant: 16).isActive = true
    self.mealTitleLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 16).isActive = true
    self.mealTitleLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -16).isActive = true
    
    self.containerView.addSubview(self.mealDescriptionLabel)
    self.mealDescriptionLabel.topAnchor.constraint(equalTo: self.mealTitleLabel.bottomAnchor, constant: 16).isActive = true
    self.mealDescriptionLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 16).isActive = true
    self.mealDescriptionLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -16).isActive = true
    self.mealDescriptionLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -16).isActive = true
  }
}
