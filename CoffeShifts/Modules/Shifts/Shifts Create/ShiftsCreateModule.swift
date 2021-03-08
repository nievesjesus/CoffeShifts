//
//  ShiftsCreateModule.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 07/03/2021.
//  
//

import UIKit

// MARK: - Router -> Presenter

protocol ShiftsCreateRouterPresenterInterface: RouterPresenterInterface {
    func close()
    func saveAndClose()
}

// MARK: - Presenter -> Router

protocol ShiftsCreatePresenterRouterInterface: PresenterRouterInterface {}

// MARK: - Presenter -> Interactor

protocol ShiftsCreatePresenterInteractorInterface: PresenterInteractorInterface {
    func shiftAdded()
}

// MARK: - Presenter -> View

protocol ShiftsCreatePresenterViewInterface: PresenterViewInterface {
    func viewDidLoad()
    func dismissView()
    func saveShift(shift: ShiftItem)
}

// MARK: - Interactor -> Presenter

protocol ShiftsCreateInteractorPresenterInterface: InteractorPresenterInterface {
    func addShift(shift: ShiftItem)
}

// MARK: - View -> Presenter

protocol ShiftsCreateViewInterface: PresenterViewInterface { }

// MARK: - Module Builder

final class ShiftsCreateModule: ModuleInterface {
    typealias View = ShiftsCreateViewController
    typealias Presenter = ShiftsCreatePresenter
    typealias Router = ShiftsCreateRouter
    typealias Interactor = ShiftsCreateInteractor

    static func build(with navController: UINavigationController,
                      sourceView: ShiftsListViewInterface) -> UIViewController {
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()

        let view = View()

        router.navController = navController
        router.sourceView = sourceView
        view.presenter = presenter

        assemble(
            presenter: presenter,
            router: router,
            interactor: interactor
        )

        return view
    }
}
