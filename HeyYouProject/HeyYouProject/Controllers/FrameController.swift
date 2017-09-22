//
//  ViewController.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/22/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class FrameController: UIViewController {
    
    private let cellID_ForYou = "CELLID"
    private let cellID_YourGreatHeyMesses = "cellid"
    
    var horizontalBarRightAnchorConstant: NSLayoutConstraint?
    
    let customNavigationBarView: customNavigationBar = {
        let view = customNavigationBar()
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let horizontalBar: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return view
    }()
    
    lazy var frameCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        collectionview.register(ForYouCell.self, forCellWithReuseIdentifier: cellID_ForYou)
        collectionview.register(YourGreatHeyMessesCell.self, forCellWithReuseIdentifier: cellID_YourGreatHeyMesses)
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        collectionview.isPagingEnabled = true
        collectionview.bounces = false
        
        return collectionview
    }()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        let marginValue = self.view.frame.size.height/12
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        view.addSubview(frameCollectionView)
        frameCollectionView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: marginValue, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        let height_customNavigationBarView = marginValue
        view.addSubview(customNavigationBarView)
        customNavigationBarView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: height_customNavigationBarView)
        
        let horizontalBarRightAnchorConstantValue = view.frame.size.width - (view.frame.size.width * 1/3.5)
        customNavigationBarView.addSubview(horizontalBar)
        horizontalBar.anchor(nil, left: customNavigationBarView.leftAnchor, bottom: customNavigationBarView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 7)
        horizontalBarRightAnchorConstant = horizontalBar.rightAnchor.constraint(equalTo: customNavigationBarView.rightAnchor)
        horizontalBarRightAnchorConstant?.isActive = true
        horizontalBarRightAnchorConstant?.constant = -horizontalBarRightAnchorConstantValue
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID_ForYou, for: indexPath) as! ForYouCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID_YourGreatHeyMesses, for: indexPath) as! YourGreatHeyMessesCell
            return cell
        }
        
    }
    
    

}

extension FrameController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let horizontalBarRightAnchorConstantValue = view.frame.size.width - (view.frame.size.width * 1/3.5)
        let increaseValue = scrollView.contentOffset.x
        horizontalBarRightAnchorConstant?.constant = -horizontalBarRightAnchorConstantValue + increaseValue
        
        if scrollView.contentOffset.x == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.horizontalBar.alpha = 1
            })
            
        } else if scrollView.contentOffset.x == self.view.frame.size.width {
            UIView.animate(withDuration: 0.5, animations: {
                self.horizontalBar.alpha = 1
            })
            
        }
        
    }
    
    
    
    
    
    
    
    
   
    
}

















