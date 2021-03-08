//
//  ShiftsCreateInteractor.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 07/03/2021.
//  
//

import Foundation

final class ShiftsCreateInteractor: InteractorInterface {
    weak var presenter: ShiftsCreatePresenterInteractorInterface?
}

// MARK: - Interactor -> Presenter

extension ShiftsCreateInteractor: ShiftsCreateInteractorPresenterInterface {

    func addShift(shift: ShiftItem) {
        ShiftsStore.shared.addShift(shift)
        presenter?.shiftAdded()
    }

}
