//
//  Currency.swift
//  LOTRConverter
//
//  Created by Sumit Upadhyay on 03/01/26.
//
import SwiftUI

 enum Currency: Double, CaseIterable, Identifiable {
    
    case copperpenny = 6400
    case silverpenny = 64
    case silverpiece = 16
    case goldpenny = 4
    case goldpiece = 1
    case platinumpenny = 0.1
    
     var id : String {name}
    
    var image: ImageResource {
        switch self {
        case .copperpenny:
                .copperpenny
        case .silverpenny:
                .silverpenny
        case .silverpiece:
                .silverpiece
        case .goldpenny:
                .goldpenny
        case .goldpiece:
                .goldpiece
        case .platinumpenny:
                .platinumpenny
        }
    }
    
    var name: String {
        switch self {
        case .copperpenny:
            "Copper Penny"
        case .silverpenny:
            "Silver Penny"
        case .silverpiece:
            "Silver Piece"
        case .goldpenny:
            "Gold Penny"
        case .goldpiece:
            "Gold Piece"
        case .platinumpenny:
            "Platinum Penny"
        }
    }
     
     func convert(_ amountString: String, _ to : Currency) -> String {
         guard let doubleAmount = Double(amountString) else {
             return ""
         }
        
         let convertedAmount = (doubleAmount / self.rawValue) * to.rawValue
         
         return String(format: "%.2f",convertedAmount)
     }
}
