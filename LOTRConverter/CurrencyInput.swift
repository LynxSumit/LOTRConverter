//
//  CurrencyInput.swift
//  LOTRConverter
//
//  Created by Sumit Upadhyay on 17/01/26.
//

import SwiftUI
import TipKit

struct CurrencyInput: View {
    let field: ContentView.Field

    @Binding var showSelectCurrency: Bool
    @Binding var currency: Currency
    @Binding var amount: String

    var currencyTip: CurrencyTip?

    @FocusState.Binding var focusedField: ContentView.Field?

    var body: some View {
        VStack {
            Button {
                showSelectCurrency.toggle()
                currencyTip?.invalidate(reason: .actionPerformed)
            } label: {
                HStack {
                    if field == .left {
                        Image(currency.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 33)

                        Text(currency.name)
                            .foregroundStyle(.white)
                    } else {
                        Text(currency.name)
                            .foregroundStyle(.white)

                        Image(currency.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 33)
                    }
                }
                .padding(.bottom, -5)
            }
            .popoverTip(currencyTip, arrowEdge: .bottom)

            TextField("Amount", text: $amount)
                .textFieldStyle(.roundedBorder)
                .focused($focusedField, equals: field)
                .onTapGesture {
                    focusedField = field
                }

        }
    }
}


#Preview {
    PreviewWrapper()
}

private struct PreviewWrapper: View {
    @State var showSelectCurrency = false
    @State var amount = "10"
    @State var currency: Currency = .silverpenny

    @FocusState var focusedField: ContentView.Field?

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            CurrencyInput(
                field: .left,
                showSelectCurrency: $showSelectCurrency,
                currency: $currency,
                amount: $amount,
                currencyTip: CurrencyTip(),
                focusedField: $focusedField
            )
            .padding()
        }
    }
}
