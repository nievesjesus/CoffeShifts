//
//  ShiftsListRouter.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//  
//

import UIKit

final class ShiftsListRouter: RouterInterface {
    weak var presenter: ShiftsListPresenterRouterInterface?
    var navController: UINavigationController?
}

extension ShiftsListRouter: ShiftsListRouterPresenterInterface {

    func navigateToCreateShift(sourceView: ShiftsListViewInterface) {
        if let navController = navController {
            let viewController = ShiftsCreateModule.build(with: navController, sourceView: sourceView)
            navController.present(viewController, animated: true, completion: nil)
        }
    }

}
