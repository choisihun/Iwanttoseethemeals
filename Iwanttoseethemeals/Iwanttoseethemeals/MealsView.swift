//
//  MealsView.swift
//  Iwanttoseethemeals
//
//  Created by 최시훈 on 10/31/23.
//

import SwiftUI

struct MealsView: View {
    @ObservedObject private var state = MealsState()
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                Text("\(state.date)")
                    .foregroundStyle(.black)
            }
            .frame(width: 200, height: 30)
            .cornerRadius(30)
            ZStack {
                Rectangle()
                    .foregroundColor(Color(uiColor: .lightGray))
                Text("\(state.breakfast)")
                    .foregroundStyle(.black)
                    .padding(10)
            }
            .frame(width: 350, height: 200)
            .cornerRadius(30)
            ZStack {
                Rectangle()
                    .foregroundColor(Color(uiColor: .lightGray))
                Text("\(state.lunch)")
                    .foregroundStyle(.black)
                    .padding(10)
            }
            .frame(width: 350, height: 200)
            .cornerRadius(30)
            ZStack {
                Rectangle()
                    .foregroundColor(Color(uiColor: .lightGray))
                Text("\(state.dinner)")
                    .foregroundStyle(.black)
                    .padding(10)
            }
            .frame(width: 350, height: 200)
            .cornerRadius(30)
        }
        .padding()
        .onAppear() {
            state.getMeals()
        }
    }
}

#Preview {
    MealsView()
}
