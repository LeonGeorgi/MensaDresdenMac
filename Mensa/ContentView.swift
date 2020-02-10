import SwiftUI
import EmealKit

struct ContentView: View {
    @State var searchString = ""
    @State var canteens: [Canteen] = []
    var body: some View {
        NavigationView {
            CanteenListView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text("Select a canteen")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

