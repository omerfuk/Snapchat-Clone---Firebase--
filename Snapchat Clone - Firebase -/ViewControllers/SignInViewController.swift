//
//  ViewController.swift
//  Snapchat Clone - Firebase -
//
//  Created by Ömer Faruk Kılıçaslan on 4.07.2022.
//

import UIKit
import Firebase



class SignInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func signInButtonClicked(_ sender: Any) {
        
        if passwordTextField.text != "" && emailTextField.text != "" {
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { auth, error in
                
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                    
                }
                else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else{
            
            self.makeAlert(title: "Error", message: "Username or Password cannot be empty!..")
        }
        
        
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        if usernameTextField.text != "" && passwordTextField.text != "" {
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { auth, error in
                
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                    
                }
                else{
                    
                    let fireStore = Firestore.firestore()
                    
                    let userDictionary = ["email": self.emailTextField.text!, "username": self.usernameTextField.text! ] as [String: Any]
                    fireStore.collection("UserInfo").addDocument(data: userDictionary) { error in
                        
                        if error != nil {
                            
                        }
                    }
                    
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
            
        }
        else{
            
            self.makeAlert(title: "Error", message: "Username or Password cannot be empty!..")
        }
    }
}

