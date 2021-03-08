//
//  ShiftsCreateView.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//

import UIKit

class ShiftsCreateView: UIView {

    private var storage = ShiftsStore.shared

    func getShift() -> ShiftItem? {
        if let role = roleSelectButton.text, !role.isEmpty,
           let employee = employeeSelectButton.text, !employee.isEmpty,
           let color = colorPicker.text, !color.isEmpty {

            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss Z"

            let start = endDatePicker.date
            let end = endDatePicker.date

            let startString = dateFormatterGet.string(from: start)
            let endString = dateFormatterGet.string(from: end)

            return ShiftItem(role: role, name: employee, startDate: startString, endDate: endString, color: color)
        }
        return nil
    }

    private var startDatePicker: UIDatePicker = {
        let aPicker = UIDatePicker()
        aPicker.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.4, *) {
            aPicker.preferredDatePickerStyle = .compact
        }
        return aPicker
    }()

    private var endDatePicker: UIDatePicker = {
        let aPicker = UIDatePicker()
        aPicker.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.4, *) {
            aPicker.preferredDatePickerStyle = .compact
        }
        return aPicker
    }()

    private var scrollView: UIScrollView = {
        let aScrollview = UIScrollView()
        aScrollview.translatesAutoresizingMaskIntoConstraints = false
        return aScrollview
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()

    private lazy var colorPicker: UITextField = {
        let aTextfield = UITextField()
        aTextfield.translatesAutoresizingMaskIntoConstraints = false
        aTextfield.font = UIFont.mediumFont(ofSize: 16)
        aTextfield.placeholder = "Select Color"
        aTextfield.loadDropdownData(data: storage.colors)
        return aTextfield
    }()

    private lazy var employeeSelectButton: UITextField = {
        let aTextfield = UITextField()
        aTextfield.translatesAutoresizingMaskIntoConstraints = false
        aTextfield.font = UIFont.mediumFont(ofSize: 16)
        aTextfield.placeholder = "Select Employee"
        aTextfield.loadDropdownData(data: storage.employees)
        return aTextfield
    }()

    private lazy var roleSelectButton: UITextField = {
        let aTextfield = UITextField()
        aTextfield.translatesAutoresizingMaskIntoConstraints = false
        aTextfield.font = UIFont.mediumFont(ofSize: 16)
        aTextfield.placeholder = "Select Role"
        aTextfield.loadDropdownData(data: storage.roles)
        return aTextfield
    }()

    private lazy var startDateLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont.mediumFont(ofSize: 12)
        aLabel.text = "Start date"
        aLabel.textColor = AppStyleManager.Color.grayPurple.get()
        return aLabel
    }()

    private lazy var endDateLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont.mediumFont(ofSize: 12)
        aLabel.text = "End date"
        aLabel.textColor = AppStyleManager.Color.grayPurple.get()
        return aLabel
    }()

    private lazy var employeeLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont.mediumFont(ofSize: 12)
        aLabel.text = "Employee"
        aLabel.textColor = AppStyleManager.Color.grayPurple.get()
        return aLabel
    }()

    private lazy var roleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont.mediumFont(ofSize: 12)
        aLabel.text = "Role"
        aLabel.textColor = AppStyleManager.Color.grayPurple.get()
        return aLabel
    }()

    private lazy var colorLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont.mediumFont(ofSize: 12)
        aLabel.text = "Color"
        aLabel.textColor = AppStyleManager.Color.grayPurple.get()
        return aLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShiftsCreateView: ProgrammaticallyLayout {

    func setupView() {
        self.backgroundColor = AppStyleManager.Color.baseWhite.get()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(startDateLabel)
        stackView.addArrangedSubview(startDatePicker)
        stackView.addArrangedSubview(endDateLabel)
        stackView.addArrangedSubview(endDatePicker)
        stackView.addArrangedSubview(employeeLabel)
        stackView.addArrangedSubview(employeeSelectButton)
        stackView.addArrangedSubview(roleLabel)
        stackView.addArrangedSubview(roleSelectButton)
        stackView.addArrangedSubview(colorLabel)
        stackView.addArrangedSubview(colorPicker)
        setupConstraints()
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])

    }

}
