//
//  CategoryModel.swift
//  TheMealsAppViperArchitecture
//
//  Created by Aji Saputra Raka Siwi on 21/01/21.
//

import Foundation

struct CategoryModel: Equatable, Identifiable {
  let id: String
  let title: String
  let image: String
  let description: String
}
