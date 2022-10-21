//
//  RegisterViewController.swift
//  Todo
//
//  Created by Ibrahim Khalilov on 2022-10-20.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var alreadyAMemberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let username = username.text, let password = password.text {
            Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
                if let error = error {
                    print(error)
                } else {
                    print("User signed Up!")
                }
            }
        }
    }
    
    @IBAction func alreadyAMemberPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "AlreadyAMember", sender: self)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
