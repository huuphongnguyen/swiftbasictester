//
//  WritingHeymessView.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/30/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class HeymessInputView: UIView {
    
    let input_heymess: UITextView = {
        let textview = UITextView()
        textview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textview.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textview.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        return textview
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

        let cornerRadius_input_heymess = (window?.frame.size.width)!/30
        addSubview(input_heymess)
        input_heymess.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        input_heymess.layer.cornerRadius = cornerRadius_input_heymess
        input_heymess.layer.masksToBounds = true
    }
}
