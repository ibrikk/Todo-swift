//
//  TodoController.swift
//  Todo
//
//  Created by Ibrahim Khalilov on 2022-10-21.
//

import UIKit
import FirebaseAuth

class TodoController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var todosTableView: UITableView!
    
    
    let todos: [Todo] = [
        Todo(title: "Do the dishes", isComplete: false, image: "dishes"),
        Todo(title: "dog", isComplete: true, image: "dog")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todosTableView.dataSource = self

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("Successfully Signed Out!")
            performSegue(withIdentifier: "RegisterSegue", sender: self)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    
}

extension TodoController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = todos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.row].title
        cell.imageView?.image = UIImage(named: todos[indexPath.row].image)
        
        return cell
    }
    
    
    
}
