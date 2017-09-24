//
//  ForYouController.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/24/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class ForYouController: UIViewController {
    
    var framecontroller: FrameController?
    
    let logoImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.isUserInteractionEnabled = false
        imageview.image = UIImage(named: "Logo")
        return imageview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let shareInfoUserTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleShareInfoUser))
        self.framecontroller?.customNavigationBarView.shareInfoUserButtonView.addGestureRecognizer(shareInfoUserTapGesture)
        
        let width_logoImageView = framecontroller?.horizontalBar.frame.size.width
        let height_logoImageView = width_logoImageView
        view.addSubview(logoImageView)
        logoImageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: view.frame.size.width/10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: width_logoImageView!, heightConstant: height_logoImageView!)
    }
    
    @objc func handleShareInfoUser() {
        print("Share Info User")
    }
}













