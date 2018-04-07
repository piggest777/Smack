//
//  AddChannelVC.swift
//  Smack
//
//  Created by Denis Rakitin on 03/04/2018.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var channelDecs: UITextField!
    
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

    }

    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelPressed(_ sender: Any) {
        
        guard let channelName = nameTxt.text, nameTxt.text != "" else {return}
        guard let channelDesc = channelDecs.text, channelDecs.text != "" else {
            return
        }
        
        SocketService.instance.addChannel(channelName: channelName , channelDescription: channelDesc) {(success) in
            if success {
                self.dismiss(animated: true, completion: nil)
                
            }
        }
    }
    
    func setUpView()  {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        
        channelDecs.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
