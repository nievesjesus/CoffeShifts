//
//  ShiftsCreateRouter.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 07/03/2021.
//  
//

import UIKit

final class ShiftsCreateRouter: RouterInterface {
    weak var presenter: ShiftsCreatePresenterRouterInterface?
    var navController: UINavigationController?
    weak var sourceView: ShiftsListViewInterface?
}

extension ShiftsCreateRouter: ShiftsCreateRouterPresenterInterface {

    func close() {
        navController?.dismiss(animated: true, completion: nil)
    }

    func saveAndClose() {
        navController?.dismiss(animated: true, completion: {
            self.sourceView?.reloadData()
        })
    }

}
