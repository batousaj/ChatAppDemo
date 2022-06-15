//
//  ConverstionVC.swift
//  ChatAppDemo
//
//  Created by Thien Vu on 14/06/2022.
//

import Foundation
import UIKit

class ConversationVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Conversations"
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
        guard let image = UIImage(systemName: "square.and.pencil") else {
            return
        }
        let barItems = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(onClickNewConvers))
        barItems.tintColor = .black
        self.navigationItem.rightBarButtonItem = barItems
    }
    
}
