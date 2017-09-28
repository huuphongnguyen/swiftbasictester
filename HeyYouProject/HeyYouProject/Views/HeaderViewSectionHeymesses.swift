//
//  HeaderViewSectionHeymesses.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/26/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class HeaderViewSectionHeymesses: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        return label
    }()
    
    let internetCheckingView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        view.alpha = 0
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let label_internetCheckingView: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "NO INTERNET CONNECTION. TRY AGAIN"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let width_label = frame.size.width * 2/3
        addSubview(label)
        label.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: width_label, heightConstant: 0)
        
        addSubview(internetCheckingView)
        internetCheckingView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        internetCheckingView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        internetCheckingView.addSubview(label_internetCheckingView)
        label_internetCheckingView.anchor(internetCheckingView.topAnchor, left: internetCheckingView.leftAnchor, bottom: internetCheckingView.bottomAnchor, right: internetCheckingView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

















