//
//  GreenTableViewCell.swift
//  SampleApp
//
//  Created by Malek TRABELSI on 31/12/2022.
//

import UIKit

class GreenTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .green
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
