//
//  ContactsVC.swift
//  ChatAppDemo
//
//  Created by Thien Vu on 14/06/2022.
//

import Foundation
import UIKit

class ContactsVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Contacts"
        self.setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.setupNavigatorBar()
    }
    
    private func setupNavigatorBar() {
        //left bar
//        self.navigationItem.rightBarButtonItem?.image =
        
        //right bar
        guard let image = UIImage(systemName: "plus") else {
            return
        }
        let barItems = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(onClickAddAccount))
        barItems.tintColor = .black
        self.navigationItem.rightBarButtonItem = barItems
    }
}
