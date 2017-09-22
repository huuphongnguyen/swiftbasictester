//
//  ViewController.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/22/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit

class FrameController: UICollectionViewController {

    private let cellID_ForYou = "CELLID"
    private let cellID_YourGreatHeyMesses = "cellid"
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupViews()
    }
    
    func setupCollectionView() {
        collectionView?.register(ForYouCell.self, forCellWithReuseIdentifier: cellID_ForYou)
        collectionView?.register(YourGreatHeyMessesCell.self, forCellWithReuseIdentifier: cellID_YourGreatHeyMesses)
    }
    
    func setupViews() {
        collectionView?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView?.bounces = false
        collectionView?.isPagingEnabled = true
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID_ForYou, for: indexPath) as! ForYouCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID_YourGreatHeyMesses, for: indexPath) as! YourGreatHeyMessesCell
            return cell
        }
        
        
    
    }
    
    

}

extension FrameController: UICollectionViewDelegateFlowLayout {
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
        let marginValue = self.view.frame.size.height/7
        return UIEdgeInsetsMake(marginValue, 0, 0, 0)
    }
}

class ForYouCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    }
}

class YourGreatHeyMessesCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
}











