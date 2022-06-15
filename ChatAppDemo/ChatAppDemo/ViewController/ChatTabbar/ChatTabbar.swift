//
//  ChatTabbar.swift
//  ChatAppDemo
//
//  Created by Thien Vu on 14/06/2022.
//

import Foundation
import UIKit

class ChatTabbar : UITabBarController {
    
    var itemBackgroundView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
        tabBar.backgroundColor = .systemGray4
        tabBar.barTintColor = UIColor(displayP3Red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        tabBar.tintColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let index = -(tabBar.items?.firstIndex(of: tabBar.selectedItem!)?.distance(to: 0))!
//        let frame = frameForTabAtIndex(index: index)
//        itemBackgroundView.center.x = frame.origin.x + frame.width/2
//        itemBackgroundView.alpha = 1
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
//        let numberOfItems = CGFloat(tabBar.items!.count)
//        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems - 20, height: tabBar.frame.height)
//        var yValue: CGFloat = 44
//        if tabBarItemSize.height < 50 {
//            yValue = 40
//        }
//        itemBackgroundView = UIView(frame: CGRect(x: tabBarItemSize.width / 2, y: yValue, width: 6, height: 6))
//        itemBackgroundView.backgroundColor = .black
//        itemBackgroundView.layer.cornerRadius = 3
//        itemBackgroundView.alpha = 0
//        tabBar.addSubview(itemBackgroundView)
    }
    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        let index = -(tabBar.items?.firstIndex(of: item)?.distance(to: 0))!
//        let frame = frameForTabAtIndex(index: index)
//        let completedFrame = frame.origin.x + frame.width/2
//        let icon = tabBar.subviews[index+1].subviews.first as! UIImageView
//        itemBackgroundView.transform = CGAffineTransform(scaleX: 0.3, y: 2)
//        if icon.image == UIImage(systemName: "gearshape.fill") {
//            icon.transform = CGAffineTransform(rotationAngle: 2)
//        }else if icon.image == UIImage(systemName: "person.2.fill"){
//            icon.transform = CGAffineTransform(scaleX: 0.5, y: 1)
//        }else{
//            icon.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//        }
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
//            self.itemBackgroundView.center.x = completedFrame
//            self.itemBackgroundView.alpha = 0.5
//            self.itemBackgroundView.transform = .identity
//            icon.transform = .identity
//        }) { (true) in
//            self.itemBackgroundView.alpha = 1
//        }
//    }
    
    // ---------------------------------------------------------------------------------------------------------------------------------------------------- //
    
    private func frameForTabAtIndex(index: Int) -> CGRect {
        var frames = tabBar.subviews.compactMap { (view:UIView) -> CGRect? in
            if let view = view as? UIControl {
                for item in view.subviews {
                    if let image = item as? UIImageView {
                        return image.superview!.convert(image.frame, to: tabBar)
                    }
                }
                return view.frame
            }
            return nil
        }
        frames.sort { $0.origin.x < $1.origin.x }
        if frames.count > index {
            return frames[index]
        }
        return frames.last ?? CGRect.zero
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
