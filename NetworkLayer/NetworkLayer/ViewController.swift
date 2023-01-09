//
//  ViewController.swift
//  NetworkLayer
//
//  Created by Malek TRABELSI on 06/01/2023.
//

import UIKit

class ViewController: UIViewController {

    static let postCellIdentifier = "PostCellIdentifier"
    @IBOutlet weak var tableView: UITableView!

    var posts: [Post] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ViewController.postCellIdentifier)

        let apiConfig = APIConfig(scheme: "https",
                                  host: "jsonplaceholder.typicode.com")
        let apiFetcher = APIFetcher()
        let api = API(apiConfig: apiConfig, apiFetcher: apiFetcher)

        api.getPosts { result in
            switch result {
            case .success(let postsResponse):
                // Display the posts
                self.posts = postsResponse
            case .failure(let error):
                // Handle the error accordingly
                // Display an error alert
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.postCellIdentifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = posts[indexPath.row].title
        content.secondaryText = posts[indexPath.row].body
        cell.contentConfiguration = content
        return cell
    }
}
