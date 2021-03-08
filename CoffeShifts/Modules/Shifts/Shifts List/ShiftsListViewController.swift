//
//  ShiftsListViewController.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//  
//

import Foundation
import UIKit

final class ShiftsListViewController: UIViewController, ViewInterface {
    var presenter: ShiftsListPresenter?
    private var customView = ShiftsListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension ShiftsListViewController: ShiftsListViewInterface {

    func reloadData() {
        customView.loadData()
    }

}

extension ShiftsListViewController: ProgrammaticallyLayout {

    func setupView() {
        customView = ShiftsListView()
        self.title = "Coffe Co Shifts"
        self.view.backgroundColor = AppStyleManager.Color.baseWhite.get()
        self.view.addSubview(customView)
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = add
        self.setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: self.view.topAnchor),
            customView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            customView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
        presenter?.getShifts()
    }

    @objc func addTapped() {
        self.presenter?.createShift()
    }

}
