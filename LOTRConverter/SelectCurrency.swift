//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Sumit Upadhyay on 29/12/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var selected_from : Currency
    @Binding var selected_to : Currency
    
    
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
                IconGrid(currency: $selected_from)
                //Text
                Text("Select the currency you'd like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                    
                    
                    
                
                // Currency Icons
                IconGrid(currency: $selected_to)
                
                
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
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var selected_from: Currency = .silverpenny
    @Previewable @State var selected_to: Currency = .copperpenny
    SelectCurrency(selected_from: $selected_from, selected_to: $selected_to)
}
