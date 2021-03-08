//
//  Colors.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//

import UIKit

enum Colors: String {
    case blue
    case red
    case green

    var getColor: UIColor {
        switch self {
        case .blue:
            return UIColor(hex: "#1976d2") ?? UIColor.blue
        case .red:
            return UIColor(hex: "#d32f2f") ?? UIColor.red
        case .green:
            return UIColor(hex: "#8bc34a") ?? UIColor.green
        }
    }
}
