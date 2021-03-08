//
//  NavigationController.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.prefersLargeTitles = true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

}
