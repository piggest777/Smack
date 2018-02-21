//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Denis Rakitin on 15/02/2018.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passTxt: UITextField!
    
    @IBOutlet weak var userImg: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let pass = passTxt.text, passTxt.text != "" else {return}
        
        
        AuthService.inctance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.inctance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        print("logged in user!", AuthService.inctance.authToken )
                    }
                })
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
        
    }
    

    
}
