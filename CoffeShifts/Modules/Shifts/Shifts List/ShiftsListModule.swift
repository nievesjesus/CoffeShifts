//
//  ShiftsListModule.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//  
//

import Foundation
import UIKit

// MARK: - Router -> Presenter

protocol ShiftsListRouterPresenterInterface: RouterPresenterInterface {
    func navigateToCreateShift(sourceView: ShiftsListViewInterface)
}

// MARK: - Presenter -> Router

protocol ShiftsListPresenterRouterInterface: PresenterRouterInterface {}

// MARK: - Presenter -> Interactor

protocol ShiftsListPresenterInteractorInterface: PresenterInteractorInterface {
    func loadAllShifts(shifts: [ShiftItem])
}

// MARK: - Presenter -> View

protocol ShiftsListPresenterViewInterface: PresenterViewInterface {
    func viewDidLoad()
    func createShift()
    func getShifts()
}
// MARK: - Interactor -> Presenter

protocol ShiftsListInteractorPresenterInterface: InteractorPresenterInterface {
    func getAllShifts()
}

// MARK: - View -> Presenter

protocol ShiftsListViewInterface: PresenterViewInterface {
    func reloadData()
    func setupView()
}

// MARK: - Module Builder

final class ShiftsListModule: ModuleInterface {
    typealias View = ShiftsListViewController
    typealias Presenter = ShiftsListPresenter
    typealias Router = ShiftsListRouter
    typealias Interactor = ShiftsListInteractor

    static func build(with navController: UINavigationController) -> UIViewController {
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()

        let view = View()

        router.navController = navController
        view.presenter = presenter

        presenter.view = view

        assemble(
            presenter: presenter,
            router: router,
            interactor: interactor
        )

        return view
    }
}
