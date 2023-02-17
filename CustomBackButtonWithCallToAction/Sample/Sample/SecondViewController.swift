//
//  SecondViewController.swift
//  Sample
//
//  Created by Malek TRABELSI on 16/02/2023.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelAction))
        self.navigationItem.leftBarButtonItem = cancelButton
    }

    @objc func cancelAction() {
        let alert = UIAlertController(title: "Confirmation", message: "Are you sure you want to quit?", preferredStyle: .alert)
        alert.addAction(.init(title: "Cancel", style: .cancel))
        let destructiveActionHandler = UIAlertAction(title: "Yes", style: .destructive) { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
        alert.addAction(destructiveActionHandler)
        present(alert, animated: true)

    }
}
