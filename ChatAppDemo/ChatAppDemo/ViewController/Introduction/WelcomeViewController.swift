//
//  ViewController.swift
//  ChatAppDemo
//
//  Created by Thien Vu on 02/01/2022.
//

import UIKit

class WelcomeViewController : UIViewController {
    var skipBut:UIButton!
    var collection:UICollectionView!
    var pageControl:UIPageControl!
    var srollView:UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // initSetupPage
        self.view.backgroundColor = .white
        
        // init layout of WelcomeView
        
        setupCollectionView()
        setupSlideAnimation()
        setupPageControll()
        setupSkipButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setupSkipButton() {
        skipBut = UIButton()
        self.view.addSubview(skipBut)
        skipBut.translatesAutoresizingMaskIntoConstraints = false
        skipBut.setTitle("SKIP", for: .normal)
        skipBut.setTitleColor(.black, for: .normal)
        skipBut.titleLabel?.font = .boldSystemFont(ofSize: 14)
        skipBut.addTarget(self, action: #selector(onClickSkip), for: .touchUpInside)
        let constraints = [
            skipBut.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            skipBut.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collection)
        
        collection.delegate = self
        collection.dataSource = self
        collection.register(WelcomeCell.self, forCellWithReuseIdentifier: "welcomeCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        // commit to learn
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        
        let constraints = [
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.topAnchor.constraint(equalTo: view.topAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func setupSlideAnimation() {
        
    }

    func setupPageControll() {
        pageControl = UIPageControl()
        self.view.addSubview(pageControl)
        pageControl.currentPage = 0
        pageControl.numberOfPages = WelcomePage.shared.welcomeSection().count
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.isUserInteractionEnabled = false
        let constraints = [
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            pageControl.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
       
    }
    
}

