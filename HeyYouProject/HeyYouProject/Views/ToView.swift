//
//  ToView.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/30/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class ToView: UIView {
    
    let toLabel: UILabel = {
        let label = UILabel()
        label.text = "TO:"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        label.isUserInteractionEnabled = true
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    lazy var to_heyIdTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textfield.placeholder = "HEY ID"
        textfield.isUserInteractionEnabled = true
        textfield.textAlignment = .center
        return textfield
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
        
        let width_toLabel = (window?.frame.size.width)!/7
        addSubview(toLabel)
        toLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: width_toLabel, heightConstant: 0)
        
        addSubview(to_heyIdTextField)
        to_heyIdTextField.anchor(topAnchor, left: toLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 5, leftConstant: 5, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        to_heyIdTextField.layer.cornerRadius = width_toLabel/5
        to_heyIdTextField.layer.masksToBounds = true
    }
}









