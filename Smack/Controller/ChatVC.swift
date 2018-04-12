//
//  ChatVC.swift
//  Smack
//
//  Created by Denis Rakitin on 31/01/2018.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var channelNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChanged(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected), name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        if AuthService.inctance.isLoggedIn {
            AuthService.inctance.findUserByEmail (completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
          
            })
        }
    
    }
    
    @objc func channelSelected(_ notif: Notification){
        updateWithChannel()
    }
    
    func updateWithChannel (){
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelNameLbl.text = "#\(channelName)"
        getMessages()
    }

    @objc func userDataDidChanged(_ notif: Notification) {
        if AuthService.inctance.isLoggedIn {
            //get channels
            onLoginGetMessages()
        } else {
            channelNameLbl.text = "Please Log in"
        }
    }
    
    
    
    func onLoginGetMessages() {
        MessageService.instance.findAllChannel { (success) in
            if success {
                if MessageService.instance.channels.count > 0 {
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    self.updateWithChannel()
                } else {
                    self.channelNameLbl.text = "No channels yet!"
                }
            }
        }
    }
    
    func getMessages() {
        guard let channelId = MessageService.instance.selectedChannel?.id else {return}
        
        MessageService.instance.findAllMessages(channelId: channelId) { (success) in
            
        }
    }
    
}
