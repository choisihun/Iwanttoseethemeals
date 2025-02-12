//
//  MealsData.swift
//  Iwanttoseethemeals
//
//  Created by 최시훈 on 10/31/23.
//

import Foundation

struct MealsData: Codable {
    let status: Int?
    let message: String?
    let data: MealsDatas
}

struct MealsDatas: Codable {
    let exists: Bool?
    let date: String?
    let breakfast: String?
    let lunch: String?
    let dinner: String?
}
