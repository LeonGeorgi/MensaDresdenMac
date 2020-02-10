//
//  CanteenListView.swift
//  Mensa
//
//  Created by Leon on 10.02.20.
//  Copyright © 2020 Leon. All rights reserved.
//

import SwiftUI
import EmealKit

struct CanteenListView: View {
    @State var canteens: [Canteen] = []
    @State var searchString: String = ""
    var body: some View {
        List {
            TextField("Search", text: $searchString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top)
            
            Section(header: Text("Canteens")) {
                ForEach(canteens.filter { canteen in
                    searchString == "" || canteen.name.lowercased().contains(searchString.lowercased())
                }) { canteen in
                    
                    NavigationLink(canteen.name, destination: CanteenView(canteen: canteen)
                        .frame(maxWidth: .infinity, maxHeight: .infinity))
                    
                }
            }
            .onAppear {
                Canteen.all { result in
                    print(result)
                    guard let canteensResult = try? result.get() else { return }
                    self.canteens = canteensResult
                }
            }
        }.listStyle(SidebarListStyle())
        
    }
}

struct CanteenListView_Previews: PreviewProvider {
    static var previews: some View {
        CanteenListView()
    }
}
