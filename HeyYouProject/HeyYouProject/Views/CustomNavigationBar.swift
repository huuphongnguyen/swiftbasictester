//
//  CustomNavigationBar.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/22/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class CustomNavigationBar: UIView {
    
    var framecontroller: FrameController?
    
    private let cellID = "CELLID"
    
    lazy var forYouButtonView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var forYouLabel: UILabel = {
        let label = UILabel()
        label.text = "FOR YOU"
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.sizeToFit()
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var yourGreatHeymessesButtonView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var yourGreatHeymessesLabel: UILabel = {
        let label = UILabel()
        label.text = "YOUR HEYMESSES"
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.sizeToFit()
        label.alpha = 0.3
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
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
    
    var forYouButtonViewLeftAnchorConstant: NSLayoutConstraint?
    var yourGreateHeymessesButtonViewRightAnchorConstant: NSLayoutConstraint?
    func setupViews() {
        let window = UIApplication.shared.keyWindow
        guard let width_window = window?.frame.size.width else {return}
        
        
        let width_forYouButtonView = width_window * 1/3.5
        addSubview(forYouButtonView)
        forYouButtonView.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: width_forYouButtonView, heightConstant: 0)
        forYouButtonViewLeftAnchorConstant = forYouButtonView.leftAnchor.constraint(equalTo: leftAnchor)
        forYouButtonViewLeftAnchorConstant?.isActive = true
        forYouButtonView.addSubview(forYouLabel)
        forYouLabel.anchor(forYouButtonView.topAnchor, left: forYouButtonView.leftAnchor, bottom: forYouButtonView.bottomAnchor, right: forYouButtonView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: -5, widthConstant: 0, heightConstant: 0)
        
        let width_yourGreatHeymessesButtonView = width_window - width_forYouButtonView
        addSubview(yourGreatHeymessesButtonView)
        yourGreatHeymessesButtonView.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: width_yourGreatHeymessesButtonView, heightConstant: 0)
        yourGreateHeymessesButtonViewRightAnchorConstant = yourGreatHeymessesButtonView.rightAnchor.constraint(equalTo: rightAnchor)
        yourGreateHeymessesButtonViewRightAnchorConstant?.isActive = true
        yourGreatHeymessesButtonView.addSubview(yourGreatHeymessesLabel)
        yourGreatHeymessesLabel.anchor(yourGreatHeymessesButtonView.topAnchor, left: yourGreatHeymessesButtonView.leftAnchor, bottom: yourGreatHeymessesButtonView.bottomAnchor, right: yourGreatHeymessesButtonView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        
    }
    
}










