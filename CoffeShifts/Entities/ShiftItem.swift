//
//  ShiftItem.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//

import Foundation

struct ShiftDictionary: Codable {
    let shifts: [ShiftItem]
}

struct ShiftItem: Codable {
    let role: String
    let name: String
    let startDate: String
    let endDate: String
    let color: String
}
