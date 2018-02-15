//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Denis Rakitin on 15/02/2018.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
        
    }
    

    
}
