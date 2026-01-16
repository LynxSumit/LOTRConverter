//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Sumit Upadhyay on 24/12/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    enum Field {
        case left
        case right
    }
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var activeSide: Field?
    
    @AppStorage("selected_from")
    private var fromRaw: String = Currency.silverpenny.name
    
    @AppStorage("selected_to")
    private var toRaw: String = Currency.goldpenny.name
    
    
    @State var selected_from: Currency = .silverpenny
    @State var selected_to: Currency = .copperpenny
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    @FocusState var focusedField: Field?
    
    let currencyTip = CurrencyTip()
    
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
                HStack {
                    CurrencyInput(
                        field: .left,
                        showSelectCurrency: $showSelectCurrency,
                        currency: $selected_from,
                        amount: $leftAmount,
                        currencyTip: currencyTip,
                        focusedField: $focusedField
                    )

                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    CurrencyInput(
                        field: .right,
                        showSelectCurrency: $showSelectCurrency,
                        currency: $selected_to,
                        amount: $rightAmount,
                        focusedField: $focusedField
                    )
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)
                
                
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
                    .task {
                        try? Tips.configure()
                    }
                    .onChange(of: focusedField, initial: false) { _, newValue in
                        activeSide = newValue
                    }
                    .onChange(of: leftAmount) {
                        if activeSide == .left {
                            rightAmount = selected_from.convert(leftAmount, selected_to)
                        }
                    }

                    .onChange(of: rightAmount) {
                        if activeSide == .right {
                            leftAmount = selected_to.convert(rightAmount, selected_from)
                        }
                    }
                    .onChange(of: selected_from) {
                        leftAmount = selected_to.convert( rightAmount,  selected_from)
                    }
                    .onChange(of: selected_to) {
                        rightAmount = selected_from.convert(leftAmount ,  selected_to)
                    }
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showSelectCurrency){
                        SelectCurrency(selected_from: $selected_from, selected_to: $selected_to)
                        
                    }
                }
                
            }
            //            .border(.blue)
            
        }.toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    focusedField = nil
                    activeSide = nil
                }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            focusedField = nil
            activeSide = nil
        }

    }
        
}

#Preview {
    ContentView()
}

