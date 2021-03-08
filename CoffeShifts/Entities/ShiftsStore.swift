//
//  ShiftsStore.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//

import Foundation

class ShiftsStore {

    private init() {}
    public static let shared = ShiftsStore()

    func loadJson(fileName: String) -> [ShiftItem] {
       let decoder = JSONDecoder()
      decoder.keyDecodingStrategy  = .convertFromSnakeCase
       guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let shiftsArray = try? decoder.decode(ShiftDictionary.self, from: data)
       else {
            return []
       }

        return shiftsArray.shifts
    }

    func initShifts() {
        if shifts.count == 0 {
            shifts = loadJson(fileName: "shifts")
        }
    }

    public private(set) var shifts: [ShiftItem] = []

    public private(set) var employees: [String] = ["Anna", "Anton", "Eugene", "Keyvan"]

    public private(set) var colors: [String] = ["red", "blue", "green"]

    public private(set) var roles: [String] = ["Waitress", "Prep", "Cook", "Front of"]

    func addShift(_ shift: ShiftItem) {
        shifts.append(shift)
    }

}
