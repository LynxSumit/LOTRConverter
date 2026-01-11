//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Sumit Upadhyay on 06/01/26.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
            
            ForEach(Currency.allCases, id: \.self) {
                currency in
                if self.currency == currency {
                    CurrencyIcon(icon: currency.image, currencyText: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                        
                }else{
                    Button{
                        self.currency = currency
                    } label: {
                        CurrencyIcon(icon: currency.image, currencyText: currency.name)
                    }
                    .buttonStyle(.plain)
                
                    
                    
                }
            }
            
        }
    }
}

#Preview {
    @Previewable @State var currency: Currency = .copperpenny
    IconGrid(currency: $currency)
}
