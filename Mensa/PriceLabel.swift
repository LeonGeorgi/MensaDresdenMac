//
//  PriceLabel.swift
//  Mensa
//
//  Created by Leon on 10.02.20.
//  Copyright © 2020 Leon. All rights reserved.
//

import SwiftUI

struct PriceLabel: View {
    var price: Double?
    var priceText: String? {
        guard let price = price else { return nil }
        return PriceLabel.priceString(for: price)
    }

    var body: AnyView {
        if let priceText = priceText {
            return AnyView(
                Text(priceText)
                    .font(.system(.caption, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .padding(4)
                    .background(Color.gray)
                    .cornerRadius(4)
            )
        } else {
            return AnyView(Text(""))
        }
    }
    
    private static func numberFormatter(style: NumberFormatter.Style, currencyCode: String? = nil, locale: Locale) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        if let currencyCode = currencyCode {
            formatter.currencyCode = currencyCode
        }
        formatter.locale = locale
        return formatter
    }
    
    static func priceString(for value: Double, locale: Locale = .current) -> String? {
        let formatter = numberFormatter(style: .currency, currencyCode: "EUR", locale: locale)
        return formatter.string(from: value as NSNumber)
    }
}

struct PriceLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PriceLabel(price: nil)
            PriceLabel(price: 2.8)
            PriceLabel(price: 15)
            PriceLabel(price: -1.5)
            PriceLabel(price: 1337)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
