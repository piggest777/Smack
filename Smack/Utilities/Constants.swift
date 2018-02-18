//
//  Constants.swift
//  Smack
//
//  Created by Denis Rakitin on 14/02/2018.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants
let BASE_URL = "https://piggychat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

// Segues

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//User Defaults
let LOGGED_IN_KEY = "loggedIn"
let TOKEN_KEY = "token"
let USER_EMAIL = "userEmail"

