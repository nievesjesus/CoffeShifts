//
//  ShiftsCreateView.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 07/03/2021.
//  
//

import Foundation
import UIKit

final class ShiftsCreateViewController: UIViewController, ViewInterface, ShiftsCreateViewInterface {
    var presenter: ShiftsCreatePresenter?
    private var customView = ShiftsCreateView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad()
    }

    @objc func dismissViewController() {
        self.presenter?.dismissView()
    }

    @objc func saveShift() {
        if let shift = self.customView.getShift() {
            self.presenter?.saveShift(shift: shift)
        } else {
            let alert = UIAlertController(title: "Error",
                                          message: "You need to select all the options to create a shift",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self    .present(alert, animated: true, completion: nil)
        }
    }

    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

}

extension ShiftsCreateViewController: ProgrammaticallyLayout {

    func setupView() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)

        self.view.backgroundColor = AppStyleManager.Color.baseWhite.get()
        self.view.addSubview(customView)
        setupConstraints()
        addNavigationBar()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 75),
            customView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            customView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }

    private func addNavigationBar() {
        let height: CGFloat = 75
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: statusBarHeight,
                                                   width: UIScreen.main.bounds.width,
                                                   height: height))
        navbar.backgroundColor = UIColor.white
        navbar.delegate = self as? UINavigationBarDelegate
        let navItem = UINavigationItem()
        navItem.title = "Create a Shift"
        navItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(dismissViewController))
        navItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                     style: .plain,
                                                     target: self,
                                                     action: #selector(saveShift))
        navbar.items = [navItem]
        view.addSubview(navbar)
        self.view?.frame = CGRect(x: 0, y: height,
                                  width: UIScreen.main.bounds.width,
                                  height: (UIScreen.main.bounds.height - height))
    }

}
