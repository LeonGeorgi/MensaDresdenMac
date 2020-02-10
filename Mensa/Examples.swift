//
//  Examples.swift
//  Mensa
//
//  Created by Leon on 10.02.20.
//  Copyright © 2020 Leon. All rights reserved.
//

import Foundation
import EmealKit

extension Canteen {
    static var example: Canteen {
        Canteen(id: 1,
                name: "Alte Mensa",
                city: "Dresden",
                address: "Mommsenstr. 13, 01069 Dresden",
                coordinates: [51.02696733929933, 13.726491630077364],
                url: URL(string: "https://www.studentenwerk-dresden.de/mensen/details-alte-mensa.html")!,
                menu: URL(string: "https://www.studentenwerk-dresden.de/mensen/speiseplan/alte-mensa.html")!
        )
    }
}
extension Meal {
    static var example: Meal {
        Meal(id: 4,
             name: "Rindfleischpfanne mit Möhre, Ananas, Mango und Kokosmilch, dazu Mie Nudeln",
             notes: ["enthält Rindfleisch", "Irgendwas anderes"],
             prices: Meal.Prices(students: 2.9, employees: 4.7),
             category: "Wok & Grill",
             image: URL(string: "https://bilderspeiseplan.studentenwerk-dresden.de/m18/201909/233593.jpg")!,
             url: URL(string: "https://studentenwerk-dresden.de")!
        )
    }
}
