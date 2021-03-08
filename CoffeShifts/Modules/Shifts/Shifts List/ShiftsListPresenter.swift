//
//  RequestConversationPresenter.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//  
//

import UIKit

final class ShiftsListPresenter: PresenterInterface {
    var router: ShiftsListRouterPresenterInterface?
    var interactor: ShiftsListInteractorPresenterInterface?
    var view: ShiftsListViewInterface?
}

// MARK: - Presenter -> Router

extension ShiftsListPresenter: ShiftsListPresenterRouterInterface {}

// MARK: - Presenter -> Interactor

extension ShiftsListPresenter: ShiftsListPresenterInteractorInterface {

    func loadAllShifts(shifts: [ShiftItem]) {
        view?.reloadData()
    }
}

// MARK: - Presenter -> View

extension ShiftsListPresenter: ShiftsListPresenterViewInterface {
    func viewDidLoad() {
        view?.setupView()
    }

    func getShifts() {
        interactor?.getAllShifts()
    }

    func createShift() {
        if let view = view {
            router?.navigateToCreateShift(sourceView: view)
        }
    }
}
