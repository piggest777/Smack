//
//  ChannelVC.swift
//  Smack
//
//  Created by Denis Rakitin on 31/01/2018.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

   //Outlets
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var userImg: CircleImage!
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChanged(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
        SocketService.instance.getChannel { (success) in
            if success{
                self.tableView.reloadData()
            }
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpUserInfo()
    }
    
    @IBAction func addChannelPressed(_ sender: Any) {
            let addChannel = AddChannelVC()
            addChannel.modalPresentationStyle = .custom
            present(addChannel, animated: true, completion: nil)
      
        
        
    }
    

    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.inctance.isLoggedIn {
            // show profile page
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
           performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    @objc func userDataDidChanged(_ notif: Notification) {
        setUpUserInfo()
    }
    
    func setUpUserInfo () {
        if AuthService.inctance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            let channel = MessageService.instance.channels[indexPath.row]
            cell.cellConfig(channel: channel)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return MessageService.instance.channels.count
    }
    
  
    
}
