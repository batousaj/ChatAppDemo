//
//  ChatTabbar.swift
//  ChatAppDemo
//
//  Created by Thien Vu on 14/06/2022.
//

import Foundation
import UIKit

class ChatTabbar : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
        tabBar.barTintColor = UIColor(displayP3Red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        tabBar.tintColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //
    }
    
    func setupView() {
        let naviList = getNavigatorBar()
        let titleList = ["Contacts","Conversations","Settings"]
        guard let logoList = getImageInTabbar() else {
            return
        }
        
        for i in 0..<naviList.count {
            naviList[i].tabBarItem.title = titleList[i]
            naviList[i].tabBarItem.image = logoList[i]
        }
        
        self.viewControllers = naviList
    }
    
    private func getNavigatorBar() -> [UINavigationController] {
        let navigatorContacts = UINavigationController(rootViewController: ContactsVC())
        let navigatorConvers  = UINavigationController(rootViewController: ConversationVC())
        let navigatorSetting  = UINavigationController(rootViewController: SettingsVC())
        
        return [navigatorContacts,navigatorConvers,navigatorSetting]
    }
    
    private func getImageInTabbar() -> [UIImage]? {
        var imageList = [UIImage]()
        
        if let contactsImage = UIImage(systemName: "person.2.fill") {
            imageList.append(contactsImage)
        } else {
            print("Error:: Cannot load the Image in Contacts")
            return nil
        }
        
        if let chatsImage = UIImage(systemName: "message.fill") {
            imageList.append(chatsImage)
        } else {
            print("Error:: Cannot load the Image in Conversation")
            return nil
        }
        
        if let settingsImage = UIImage(systemName: "gearshape.fill") {
            imageList.append(settingsImage)
        } else {
            print("Error:: Cannot load the Image in Setting")
            return nil
        }
        
        return imageList
    }
}
