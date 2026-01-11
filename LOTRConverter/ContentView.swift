//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Sumit Upadhyay on 24/12/25.
//

import SwiftUI

struct ContentView: View {
    
   @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var selected_from: Currency = .silverpenny
    @State var selected_to: Currency = .copperpenny
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    

    var body: some View {
        ZStack{
            // Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                // Prancing Pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency Conversion Text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Conversion section
                HStack{
                    // Left Conversion section
                    VStack{
                        // Currency
                        
                        Button {
                            showSelectCurrency.toggle()
                        } label: {
                            HStack{
                                // Currency Image
                                Image(selected_from.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 33)
                                
                                
                                // Currency Text
                                Text(selected_from.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }
                            .padding(.bottom, -5)
                        }
                        
                        //Text Fielf
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .onChange(of: leftAmount) {
                                if leftTyping {
                                    rightAmount = selected_from.convert(leftAmount ,  selected_to)
                                }
                            }
                        
                    }
                    
                    // Equal Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right Conversion Section
                    VStack{
                        // Currency
                        
                        Button {
                            showSelectCurrency.toggle()
                        } label: {
                            HStack{
                                // Currency Text
                                Text(selected_to.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                // Currency Image
                                Image(selected_to.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 33)
                            }
                            .padding(.bottom, -5)
                        }
                        
                        //Textfielf
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($rightTyping)
                            .onChange(of: rightAmount) {
                                if rightTyping {
                                    leftAmount = selected_to.convert( rightAmount,  selected_from)
                                }
                            }
                        
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                
                Spacer()
                
                // Info button
                HStack{
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showSelectCurrency){
                        SelectCurrency(selected_from: $selected_from, selected_to: $selected_to)
                            .onChange(of: selected_from) {
                            leftAmount = selected_to.convert( rightAmount,  selected_from)
                            }
                            .onChange(of: selected_to) {
                                rightAmount = selected_from.convert(leftAmount ,  selected_to)
                            }
                        
                    }
                }
                
            }
//            .border(.blue)

        }
    }
}

#Preview {
    ContentView()
}

