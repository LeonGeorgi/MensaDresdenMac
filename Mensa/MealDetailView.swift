//
//  MealDetailView.swift
//  Mensa
//
//  Created by Leon on 10.02.20.
//  Copyright © 2020 Leon. All rights reserved.
//

import SwiftUI
import EmealKit
import SDWebImageSwiftUI

struct MealDetailView: View {
    let meal: Meal
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                WebImage(url: meal.image).resizable().aspectRatio(contentMode: .fit)
                
                Text(meal.name)
                    .font(.title)
                    .lineLimit(5)
                    .layoutPriority(1)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Student")
                        PriceLabel(price: meal.prices?.students)
                    }
                    HStack {
                        Text("Employee")
                        PriceLabel(price: meal.prices?.employees)
                    }
                }.padding()
                
                VStack(alignment: .leading) {
                    ForEach(meal.notes, id: \.self) { note in
                        Text(note)
                            .font(.caption)
                    }
                }.padding(.horizontal)
                
            }
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(meal: Meal.example)
    }
}
