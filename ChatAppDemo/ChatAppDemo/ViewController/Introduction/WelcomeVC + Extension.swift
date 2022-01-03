//
//  WelcomeVC + Extension.swift
//  ChatAppDemo
//
//  Created by Thien Vu on 03/01/2022.
//

import Foundation
import UIKit

extension WelcomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let xValue = targetContentOffset.pointee.x
        let pageNum = Int(xValue / view.frame.width)
        pageControl.currentPage = pageNum
        if pageNum != WelcomePage.shared.welcomeSection().count - 1 {
            skipBut.isHidden = false
        }else{
//            goToSignInController()
            skipBut.isHidden = true
        }
//        if pageControl.currentPage > 0 { slideAnimView.isHidden = true } else { slideAnimView.isHidden = false }
    }
    
// MARK: - delegate of CollectionView
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WelcomePage.shared.welcomeSection().count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "welcomeCell", for: indexPath) as! WelcomeCell
        print("TV: \(indexPath.row)")
        let section = WelcomePage.shared.welcomeSection()
        cell.configured(section[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let welcomeCell = cell as! WelcomeCell
        welcomeCell.sectionImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        welcomeCell.descriptionSection.transform = CGAffineTransform(translationX: view.frame.origin.x + view.frame.width/2, y: 0)
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            welcomeCell.sectionImage.transform = .identity
            welcomeCell.descriptionSection.transform = .identity
        })
    }
    
    
// MARK: - Action OBJC target
            
    @objc func onClickSkip(_ sender:UIButton) {
        
    }
}
