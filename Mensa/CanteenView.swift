import SwiftUI
import EmealKit
import SDWebImageSwiftUI

struct CanteenView: View {
    let canteen: Canteen
    
    @State var meals: [Meal] = []
    @State var isStudent: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $isStudent) {
                    Text("Student").tag(true)
                    Text("Employee").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                MealListView(meals: meals, isStudent: isStudent)
            }.frame(minWidth: 300, idealWidth: 400, maxHeight: .infinity)
            
            Text("Select a meal").frame(minWidth: 200, idealWidth: 400, maxHeight: .infinity)
        }
        .onAppear {
            Meal.for(canteen: self.canteen.id, on: Date()) { result in
                guard let loadedMeals = try? result.get() else { return }
                
                self.meals = loadedMeals
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct CanteenView_Previews: PreviewProvider {
    static var previews: some View {
        CanteenView(canteen: Canteen.example)
    }
}
