//
//  ViewController.swift
//  Todo
//
//  Created by Ibrahim Khalilov on 2022-10-20.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if let email = loginField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult,
                error in
                if let error = error {
                    print(error)
                } else {
                    print("Successfully Signed In")
                    self.performSegue(withIdentifier: "LoggedIn", sender: self)
                }
            }
        }
    }
    

}

