//
//  ViewController.swift
//  SampleApp
//
//  Created by Malek TRABELSI on 31/12/2022.
//

import UIKit

final class ViewController: UIViewController {

    private static let redTableViewCellIdentifier = "RedTableViewCell"
    private static let greenTableViewCellIdentifier = "GreenTableViewCell"
    private static let blueTableViewCellIdentifier = "BlueTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        commonUI()
    }

    lazy var tableView = {
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    private func commonUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        tableView.register(RedTableViewCell.self, forCellReuseIdentifier: ViewController.redTableViewCellIdentifier)
        tableView.register(GreenTableViewCell.self, forCellReuseIdentifier: ViewController.greenTableViewCellIdentifier)
        tableView.register(BlueTableViewCell.self, forCellReuseIdentifier: ViewController.blueTableViewCellIdentifier)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0...9:
            let cell: RedTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            return cell
        case 10...19:
            let cell: GreenTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            return cell
        case 20...29:
            let cell: BlueTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
