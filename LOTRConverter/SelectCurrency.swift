//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Sumit Upadhyay on 29/12/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            // Bg parchment image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                // Text
                Text("Select currency you are starting with:")
                    .fontWeight(.bold)
                
                
                // Currency Icons
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
                    
                    ForEach(0..<5) {
                        _ in CurrencyIcon(icon: .copperpenny, currencyText: "Copper Penny")
                    }
                    
                }
                //Text
                Text("Select the currency you'd like to convert to:")
                    .fontWeight(.bold)
                    
                    
                    
                
                // Currency Icons
                
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
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency()
}
