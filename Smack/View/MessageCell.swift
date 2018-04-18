//
//  MessageCell.swift
//  Smack
//
//  Created by Denis Rakitin on 18/04/2018.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    //Outlets
    
    @IBOutlet weak var userImg: CircleImage!
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBOutlet weak var timeStampLbl: UILabel!
    
    @IBOutlet weak var messageLblBody: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    func configureCell (message: Message) {
        messageLblBody.text = message.message
        userNameLbl.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
        
    }
}
