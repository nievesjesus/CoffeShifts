//
//  RequestConversationPresenter.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 07/03/2021.
//  
//

import Foundation

final class ShiftsCreatePresenter: PresenterInterface {
    var router: ShiftsCreateRouterPresenterInterface?
    var interactor: ShiftsCreateInteractorPresenterInterface?
}

// MARK: - Presenter -> Router

extension ShiftsCreatePresenter: ShiftsCreatePresenterRouterInterface {}

// MARK: - Presenter -> Interactor

extension ShiftsCreatePresenter: ShiftsCreatePresenterInteractorInterface {

    func shiftAdded() {
        self.router?.saveAndClose()
    }

}

// MARK: - Presenter -> View

extension ShiftsCreatePresenter: ShiftsCreatePresenterViewInterface {

    func viewDidLoad() {
    }

    func dismissView() {
        router?.close()
    }

    func saveShift(shift: ShiftItem) {
        interactor?.addShift(shift: shift)
    }

}
