//
//  UsersVC.swift
//  NetworkRequests
//
//  Created by Евгений on 26.07.21.
//

import UIKit

class UsersVC: UITableViewController {
    
    private let jsonUrl = "https://jsonplaceholder.typicode.com/users"

    private var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowUserDetail" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let userDetailVC = segue.destination as! DetailUserVC
        userDetailVC.user = users[indexPath.row]
    }
    
    
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.username
        return cell
    }
    

    func fetchData() {
        guard let url = URL(string: jsonUrl) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                self.users = try JSONDecoder().decode([User].self, from: data)
                print(self.users)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }

}
