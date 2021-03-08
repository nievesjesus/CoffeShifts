//
//  AppStyleManager.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//

import UIKit

struct AppStyleManager {

    enum Color: String {
        case baseWhite = "#FFFFFF"
        case grayPurple = "#4E4F76"
        case softPurple = "#3E3F68"
        case lightPurple = "#222455"

        func get() -> UIColor? {
            let color = self.rawValue
            return UIColor(hex: color)
        }
    }
}
