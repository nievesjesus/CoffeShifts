//
//  UIFont+Extension.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//

import UIKit

extension UIFont {

    private static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }

    static func boldFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "JosefinSans-Bold", size: size)
    }

    static func extraLightFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "JosefinSans-ExtraLight", size: size)
    }

    static func lightFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "JosefinSans-Light", size: size)
    }

    static func mediumFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "JosefinSans-Medium", size: size)
    }
    static func regularFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "JosefinSans-Regular", size: size)
    }

    static func semiBoldFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "JosefinSans-SemiBold", size: size)
    }

    static func thinFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "JosefinSans-Thin", size: size)
    }

}
