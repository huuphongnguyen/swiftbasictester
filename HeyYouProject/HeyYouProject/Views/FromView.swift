//
//  FromView.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/30/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class FromView: UIView {
    
    var writingheymesscontroller: WritingHeymessController?
    
    let fromLabel: UILabel = {
        let label = UILabel()
        label.text = "FROM:"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        label.isUserInteractionEnabled = true
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    lazy var from_nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.text = "Nguyen Huu Phong"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
        label.isUserInteractionEnabled = true
        label.textAlignment = .center
        label.numberOfLines = 1
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
        
        let window = UIApplication.shared.keyWindow
        
        let width_fromLabel = (window?.frame.size.width)!/7
        addSubview(fromLabel)
        fromLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: width_fromLabel, heightConstant: 0)
        
        addSubview(from_nameLabel)
        from_nameLabel.anchor(topAnchor, left: fromLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}










