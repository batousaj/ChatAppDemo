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


class WelcomePage {
    
    static let shared = WelcomePage()
    private var section:[WelcomeModel]!
    
    private init() {
        section = [
            WelcomeModel.init(imageName: "Logo-Light", title: "mChat", discription: "The messaging app."),
            WelcomeModel.init(imageName: "Chat", title: "Chat", discription: "Contact your friends by sending them text, audio or media messages."),
            WelcomeModel.init(imageName: "MapsHome", title: "Design", discription: "Make your messenger look the way you like it."),
            WelcomeModel.init(imageName: "Design", title: "Maps", discription: "Share your location with your friends."),
            WelcomeModel.init(imageName: "WelcomeEnd", title: "Start Messaging", discription: "Get started")
        ]
    }
    
    public func numOfWelcomeSection() -> Int {
        return section.count
    }
    
    public func welcomeSection() -> [WelcomeModel] {
        return section
    }
    
}
