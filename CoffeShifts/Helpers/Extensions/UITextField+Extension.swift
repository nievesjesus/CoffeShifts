//
//  UITextField+Extension.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//

import UIKit

extension UITextField {
    func loadDropdownData(data: [String]) {
        self.inputView = MyPickerView(pickerData: data, dropdownField: self)
    }
}
