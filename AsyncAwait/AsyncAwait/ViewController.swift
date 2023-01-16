//
//  ViewController.swift
//  AsyncAwait
//
//  Created by Malek TRABELSI on 13/01/2023.
//

import UIKit

class ViewController: UIViewController {

    static let postCellIdentifier = "PostCellIdentifier"

    @IBOutlet weak var tableView: UITableView!

    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ViewController.postCellIdentifier)
        Task {
            let apiConfig = APIConfig(scheme: "https",
                                      host: "jsonplaceholder.typicode.com")
            let apiFetcher = APIFetcher()
            let api = API(apiConfig: apiConfig, apiFetcher: apiFetcher)

            do {
                let posts = try await api.getPosts()
                update(with: posts)
            } catch {
                print("AN ERROR OCCURED")
            }
        }
    }

    @MainActor
    private func update(with posts: [Post]) {
        self.posts = posts
        self.tableView.reloadData()
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
