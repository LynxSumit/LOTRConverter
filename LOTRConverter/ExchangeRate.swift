//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Sumit Upadhyay on 28/12/25.
//

import SwiftUI

struct ExchangeRate: View {
    
    let leftImageSource : ImageResource
    let exchangeRateText: String
    let rightImageSource: ImageResource
    
    
    var body: some View {
        HStack{
            // Left Currency Image
            Image(leftImageSource)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange Rate text
            Text(exchangeRateText)
            
            // Right Currency Image
            Image(rightImageSource)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}

#Preview {
    ExchangeRate(leftImageSource: .goldpiece, exchangeRateText: "1 Gold Piece = 4 Gold Pennies", rightImageSource: .goldpenny)
}
