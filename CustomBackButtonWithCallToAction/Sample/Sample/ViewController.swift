//
//  ViewController.swift
//  Sample
//
//  Created by Malek TRABELSI on 16/02/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onStartClick(_ sender: Any) {
        let viewController = SecondViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

