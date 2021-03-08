//
//  ShiftsListView.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//

import UIKit

class ShiftsListView: UIView {

    private var store = ShiftsStore.shared

    func loadData () {
        tableView.reloadData()
    }

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ShiftsListTablewViewCell.self, forCellReuseIdentifier: ShiftsListTablewViewCell.idCell)
        table.separatorColor = .clear
        table.estimatedRowHeight = 150
        table.rowHeight = UITableView.automaticDimension
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        table.dataSource = self
        table.delegate = self
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ShiftsListView: ProgrammaticallyLayout {

    func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }

}

extension ShiftsListView: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.shifts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShiftsListTablewViewCell.idCell,
                                                       for: indexPath) as? ShiftsListTablewViewCell else {
            return UITableViewCell()
        }
        let item = store.shifts[indexPath.row]
        cell.configureCell(item: item)
        return cell
    }

}
