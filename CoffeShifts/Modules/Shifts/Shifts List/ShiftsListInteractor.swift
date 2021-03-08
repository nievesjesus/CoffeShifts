//
//  ShiftsListInteractor.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 07/03/2021.
//  
//

import Foundation

final class ShiftsListInteractor: InteractorInterface {
    weak var presenter: ShiftsListPresenterInteractorInterface?
    var shiftStore = ShiftsStore.shared
    var shifts: [ShiftItem] {
        return shiftStore.shifts
    }
}

// MARK: - Interactor -> Presenter

extension ShiftsListInteractor: ShiftsListInteractorPresenterInterface {

    func getAllShifts() {
        presenter?.loadAllShifts(shifts: shifts)
    }
}
