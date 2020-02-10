import SwiftUI
import EmealKit

struct MealListView: View {
    let meals: [Meal]
    let isStudent: Bool
    var body: some View {
        List {
            ForEach(Dictionary(grouping: meals, by: { $0.category }).sorted { $0.0.lowercased() < $1.0.lowercased() }, id: \.0) { entry in
                Section(header: Text(entry.0)) {
                    ForEach(entry.1) { (meal: Meal) in
                        NavigationLink(destination:
                            MealDetailView(meal: meal).frame(minWidth: 200, idealWidth: 400, maxHeight: .infinity, alignment: .top)
                        ) {
                            HStack {
                                Text(meal.name)
                                Spacer()
                                if self.isStudent {
                                    PriceLabel(price: meal.prices?.students)
                                } else {
                                    PriceLabel(price: meal.prices?.employees)
                                }
                            }
                        }
                    }
                }
            }
            
        }
    }
}


struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        //MealListView()
        Text("Test")
    }
}
