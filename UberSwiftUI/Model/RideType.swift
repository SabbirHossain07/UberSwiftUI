//
//  RideType.swift
//  UberSwiftUI
//
//  Created by Sopnil Sohan on 26/6/23.
//

import SwiftUI

enum RideType: Int ,Identifiable, CaseIterable {
    case uberX
    case uberBlack
    case uberXL
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .uberX:
            return "UberX"
        case .uberBlack:
            return "UberBlack"
        case .uberXL:
            return "UberXL"
        }
    }
    
    var imageName: String {
        switch self {
            
        case .uberX:
            return "uber-x"
        case .uberBlack:
            return "uber-black"
        case .uberXL:
            return "uber-x"
        }
    }
    
    var baseFair: Double {
        switch self {
        case .uberX:
            return 5
        case .uberBlack:
            return 20
        case .uberXL:
            return 10
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600
        
        switch self {
        case .uberX:
            return distanceInMiles * 1.5 + baseFair
        case .uberBlack:
            return distanceInMiles * 2.0 + baseFair
        case .uberXL:
            return distanceInMiles * 1.75 + baseFair
        }
        
    }
}
