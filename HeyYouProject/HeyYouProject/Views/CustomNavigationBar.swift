//
//  CustomNavigationBar.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/22/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents
import Lottie

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
    
    lazy var shareInfoUserButtonView: LOTAnimationView = {
        let lotview = LOTAnimationView(name: "ShareInfoButton")
        lotview.isUserInteractionEnabled = true
        lotview.loopAnimation = true
        lotview.contentMode = .scaleAspectFit
        lotview.alpha = 0
        lotview.clipsToBounds = true
        return lotview
    }()
    
    lazy var writingHeyMessButtonView: LOTAnimationView = {
        let lotview = LOTAnimationView(name: "WritingHeyMessButton")
        lotview.isUserInteractionEnabled = true
        lotview.loopAnimation = true
        lotview.contentMode = .scaleAspectFit
        lotview.alpha = 0
        lotview.clipsToBounds = true
        return lotview
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
    
    lazy var infoUserLabel: UILabel = {
        let label = UILabel()
        label.text = "YOUR INFORMATION"
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.sizeToFit()
        label.alpha = 0
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var settingsButtonView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "Settings")
        imageview.alpha = 0
        imageview.isUserInteractionEnabled = true
        return imageview
    }()
    
    lazy var heymessLabel: UILabel = {
        let label = UILabel()
        label.text = "YOUR HEYMESS"
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.sizeToFit()
        label.alpha = 0
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var closeControllerButtonView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "CloseController")
        imageview.alpha = 0
        imageview.isUserInteractionEnabled = true
        return imageview
    }()
    
    lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "SETTINGS"
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.sizeToFit()
        label.alpha = 0
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var shareHeymessButtonView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "ShareHeymess")
        imageview.alpha = 0
        imageview.isUserInteractionEnabled = true
        return imageview
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
        
        let bounds = UIScreen.main.bounds
        let widthScreen = bounds.size.width
        let heightScreen = bounds.size.height
        
        
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

        let height_customNavigationBar = heightScreen/12
        let height_shareInfoUserButtonView = height_customNavigationBar * 3/4
        let width_shareInfoUserButtonView = height_shareInfoUserButtonView
        addSubview(shareInfoUserButtonView)
        shareInfoUserButtonView.anchor(nil, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: width_shareInfoUserButtonView, heightConstant: height_shareInfoUserButtonView)
        shareInfoUserButtonView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        shareInfoUserButtonView.play()
        
        let width_writingHeyMessButtonView = height_customNavigationBar * 3/4
        let height_writingHeyMessButtonView = width_writingHeyMessButtonView
        addSubview(writingHeyMessButtonView)
        writingHeyMessButtonView.anchor(nil, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: width_writingHeyMessButtonView, heightConstant: height_writingHeyMessButtonView)
        writingHeyMessButtonView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        writingHeyMessButtonView.play()
        
        let width_infoUserLabel = widthScreen * 2/3
        addSubview(infoUserLabel)
        infoUserLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: width_infoUserLabel, heightConstant: 0)
        infoUserLabel.transform = CGAffineTransform(translationX: 0, y: -50)
        
        let width_heymessLabel = widthScreen * 2/3
        addSubview(heymessLabel)
        heymessLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: width_heymessLabel, heightConstant: 0)
        heymessLabel.transform = CGAffineTransform(translationX: 0, y: -50)
        
        let width_closeInfoUserControllerButtonView = height_customNavigationBar
        addSubview(closeControllerButtonView)
        closeControllerButtonView.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: width_closeInfoUserControllerButtonView, heightConstant: 0)
        closeControllerButtonView.transform = CGAffineTransform(translationX: 0, y: -50)
        
        addSubview(settingsButtonView)
        settingsButtonView.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: closeControllerButtonView.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 5, widthConstant: width_closeInfoUserControllerButtonView, heightConstant: 0)
        settingsButtonView.transform = CGAffineTransform(translationX: 0, y: 50)
        
        addSubview(shareHeymessButtonView)
        shareHeymessButtonView.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: closeControllerButtonView.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 5, widthConstant: width_closeInfoUserControllerButtonView, heightConstant: 0)
        shareHeymessButtonView.transform = CGAffineTransform(translationX: 0, y: 50)

        let width_settingsLabel = widthScreen * 2/3
        addSubview(settingsLabel)
        settingsLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: width_settingsLabel, heightConstant: 0)
        settingsLabel.transform = CGAffineTransform(translationX: 0, y: -50)
    }
    
}










