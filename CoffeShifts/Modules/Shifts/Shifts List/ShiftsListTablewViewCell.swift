//
//  ShiftsListTablewViewCell.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//

import UIKit

final class ShiftsListTablewViewCell: UITableViewCell {

    func configureCell(item: ShiftItem) {

        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss Z"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "E, d MMM yyyy h:mm a"

        let hoursFormatterPrint = DateFormatter()
        hoursFormatterPrint.dateFormat = "h:mm a"

        titleLabel.text = "\(item.name) (\(item.role))"

        if let date = dateFormatterGet.date(from: item.startDate) {
            descriptionLabel.text = dateFormatterPrint.string(from: date)
        }

        if let hours = dateFormatterGet.date(from: item.endDate) {
            statusLabel.text = "⏰ \(hoursFormatterPrint.string(from: hours))"
        }
        avatarView.backgroundColor = Colors(rawValue: item.color)?.getColor
    }

    private lazy var avatarView: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.layer.cornerRadius = 28
        aView.backgroundColor = AppStyleManager.Color.grayPurple.get()?.withAlphaComponent(0.5)
        return aView
    }()

    private lazy var titleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.font = UIFont.semiBoldFont(ofSize: 14)
        aLabel.textColor = AppStyleManager.Color.softPurple.get()?.withAlphaComponent(0.5)
        return aLabel
    }()

    private lazy var descriptionLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.font = UIFont.semiBoldFont(ofSize: 12)
        aLabel.textColor = AppStyleManager.Color.lightPurple.get()?.withAlphaComponent(0.5)
        return aLabel
    }()

    private lazy var statusLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.font = UIFont.semiBoldFont(ofSize: 10)
        aLabel.textColor = AppStyleManager.Color.softPurple.get()?.withAlphaComponent(0.5)
        aLabel.textAlignment = .right
        return aLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ShiftsListTablewViewCell: ProgrammaticallyLayout {

    func setupView() {
        self.selectionStyle = .none
        self.contentView.addSubview(avatarView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(statusLabel)
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarView.heightAnchor.constraint(equalToConstant: 56),
            avatarView.widthAnchor.constraint(equalToConstant: 56),
            avatarView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            avatarView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            avatarView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 26),
            titleLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 12),
            statusLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 26),
            statusLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            descriptionLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

}
