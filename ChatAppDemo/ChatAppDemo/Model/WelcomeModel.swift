//
//  WelcomeModel.swift
//  ChatAppDemo
//
//  Created by Thien Vu on 03/01/2022.
//

import Foundation

struct WelcomeModel {
    let imageName:String?
    
    let title:String?
    
    let discription:String?
}

enum TitleTabbar:String {
    case Conversation = "Conversations"
    case Contacts = "Contacts"
    case Settings = "Settings"
}


class WelcomePage {
    
    static let shared = WelcomePage()
    private var section:[WelcomeModel]!
    
    private init() {
        section = [
            WelcomeModel(imageName: "Logo-Light", title: "mChat", discription: "The messaging app."),
            WelcomeModel(imageName: "Chat", title: "Chat", discription: "Contact your friends by sending them text, audio or media messages."),
            WelcomeModel(imageName: "MapsHome", title: "Maps", discription: "Share your location with your friends."),
            WelcomeModel(imageName: "Design", title: "Design", discription: "Make your messenger look the way you like it."),
            WelcomeModel(imageName: "WelcomeEnd", title: "Start Messaging", discription: "")
        ]
    }
    
    public func numOfWelcomeSection() -> Int {
        return section.count
    }
    
    public func welcomeSection() -> [WelcomeModel] {
        return section
    }
    
}
