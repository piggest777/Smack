//
//  ChannelVC.swift
//  Smack
//
//  Created by Denis Rakitin on 31/01/2018.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60

    }


}
