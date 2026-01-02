//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Sumit Upadhyay on 28/12/25.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            // Bg parchment image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                
                // Title Text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                    .foregroundStyle(.black)
                
                // Description Text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                
                // Exchange Rates
                
                    ExchangeRate(leftImageSource: .goldpiece, exchangeRateText: "1 Gold Piece = 4 Gold Pennies", rightImageSource: .goldpenny)
                
                    ExchangeRate(leftImageSource: .goldpenny, exchangeRateText: "1 Gold Penny = 4 Silver Pieces", rightImageSource: .silverpiece)
                
                    ExchangeRate(leftImageSource: .silverpiece, exchangeRateText: "1 Silver Piece = 4 Silver Pennies", rightImageSource: .silverpenny)

                    ExchangeRate(leftImageSource: .silverpenny, exchangeRateText: "1 Silver Penny = 100 Copper Pennies", rightImageSource: .copperpenny)

                
                
                // Done Button
                
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .buttonBorderShape(.roundedRectangle(radius: 8))
                .font(.title)
                .padding()
                .foregroundStyle(.white)
    
            }
            .foregroundStyle(.black)
            
        }
    }
}

#Preview {
    ExchangeInfo()
}
