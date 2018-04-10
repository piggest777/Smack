//
//  MessegeService.swift
//  Smack
//
//  Created by Denis Rakitin on 03/04/2018.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService{
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    var selectedChannel : Channel?
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                
                guard let data = response.data else {return}
//
//                do {
//                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
//                } catch let error {
//                    debugPrint(error as Any)
//                }
//
//                print(self.channels)
                
                do {
                
                    if let json = try JSON(data: data).array {
                        for item in json{
                            let name = item ["name"].stringValue
                            let channelDescrition = item["description"].stringValue
                            let id = item["_id"].stringValue
                            let channel = Channel(channelTitle: name, channelDescription: channelDescrition, id: id)
                            self.channels.append(channel)
                        }
                        NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED , object: nil)
                    }
                } catch {
                    debugPrint(error)
                }
                completion(true)
                
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func clearChannels() {
        channels.removeAll()
    }
    
}
