//
//  Extension.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 22/01/21.
//

import UIKit.UIColor

extension UIColor {
  static var random: UIColor {
    return UIColor(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1),
      alpha: 0.3)
  }
}
