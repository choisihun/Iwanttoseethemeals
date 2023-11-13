//
//  MealsState.swift
//  Iwanttoseethemeals
//
//  Created by 최시훈 on 10/31/23.
//

import SwiftUI
import Alamofire

class MealsState: ObservableObject {
    @Published var date: String = ""
    
    @Published var breakfast: String = ""
    
    @Published var lunch: String = ""
    
    @Published var dinner: String = ""
    
    @Published var showing: Bool = false
    
    func getMeals() {
        let currentDate = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: currentDate)
        let month = calendar.component(.month, from: currentDate)
        let day = calendar.component(.day, from: currentDate)
        let url = "https://dodam.b1nd.com/api/meal?year=\(year)&month=\(month)&day=\(day)"
        date = "\(year)년 \(month)월 \(day)일"
        AF.request(url, method: .get)
            .validate()
            .responseData { response in
                switch response.result {
                case.success(let value):
                    let decoder = JSONDecoder()
                    if let decodedData = try? decoder.decode(MealsData.self, from: value).data {
                        if decodedData.breakfast != nil {
                            self.breakfast = decodedData.breakfast!
                        } else { 
                            self.breakfast = "아침이 없습니다."
                        }
                        if decodedData.breakfast != nil {
                            self.lunch = decodedData.lunch!
                        } else {
                            self.lunch = "점심이 없습니다."
                        }
                        if decodedData.breakfast != nil {
                            self.dinner = decodedData.dinner!
                        } else {
                            self.dinner = "저녁이 없습니다."
                        }
                    } else {
                        print("야 이거 뭔가 좀 이상한데")
                    }
                case.failure(let error):
                    print(error.localizedDescription)
                }
                
            }
    }
}
