//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Sumit Upadhyay on 29/12/25.
//

import SwiftUI

struct CurrencyIcon: View {
    let icon: ImageResource
    let currencyText: String
    
    var body: some View {
        ZStack(alignment: .bottom){
            // Currency Image
            Image(icon)
                .resizable()
                .scaledToFit()
            
            // Currency Name
            Text(currencyText)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
            
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown.opacity(0.7))
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(icon: .copperpenny, currencyText: "Copper Penny")
}
