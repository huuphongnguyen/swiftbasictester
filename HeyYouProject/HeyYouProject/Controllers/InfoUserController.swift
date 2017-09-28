//
//  InfoUserController.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/25/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class InfoUserController: UIViewController {
    
    var yourgreatheymessescontroller: YourGreatHeyMessesController?
    var closeController_tapGesture: UIGestureRecognizer!
    var settingsController_tapGesture: UIGestureRecognizer!
    
    let customNavigationBar_InfoUserController: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return view
    }()
    
    // MARK: - Life Cyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationWhenAppear()
        disableScrollingFrameController(isOn: false)
        changeCustomNavigationBarCharacters(alphaValue_infoUserLabel: 1, tranformValue_infoUserLabel: CGAffineTransform.identity, alphaValue_closeControllerButtonView: 1, tranformValue_closeControllerButtonView: CGAffineTransform.identity, alphaValue_yourGreatHeymessesButtonView: 0, tranformValue_yourGreatHeymessesButtonView: CGAffineTransform(translationX: 0, y: 50), alphaValue_writingHeyMessButtonView: 0, tranformValue_writingHeyMessButtonView: CGAffineTransform(translationX: 0, y: 50), writingHeyMessIsEnable: false)
        changeCustomNavigationBar_addSettingsButtonView(alphaValue: 1, tranformValue: CGAffineTransform.identity)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        changeCustomNavigationBarCharacters(alphaValue_infoUserLabel: 0, tranformValue_infoUserLabel: CGAffineTransform(translationX: 0, y: -50), alphaValue_closeControllerButtonView: 0, tranformValue_closeControllerButtonView: CGAffineTransform(translationX: 0, y: -50), alphaValue_yourGreatHeymessesButtonView: 1, tranformValue_yourGreatHeymessesButtonView: CGAffineTransform.identity, alphaValue_writingHeyMessButtonView: 1, tranformValue_writingHeyMessButtonView: CGAffineTransform.identity, writingHeyMessIsEnable: true)
        changeCustomNavigationBar_addSettingsButtonView(alphaValue: 0, tranformValue: CGAffineTransform(translationX: 0, y: 50))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        disableScrollingFrameController(isOn: true)
    }
    
    // MARK: - Function
    func setupViews() {
        
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        closeController_tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCloseInfoUserController))
        self.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView.closeControllerButtonView.addGestureRecognizer(closeController_tapGesture)
        
        settingsController_tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleOpenSettingsController))
        
        self.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView.settingsButtonView.addGestureRecognizer(settingsController_tapGesture)
    }
    
    func animationWhenAppear() {
        self.view.transform = CGAffineTransform(translationX: 100, y: 0)
        self.view.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.view.transform = CGAffineTransform.identity
            self.view.alpha = 1
        }) { (animation) in
            
        }
    }
    
    func disableScrollingFrameController(isOn: Bool) {
        self.yourgreatheymessescontroller?.framecontroller?.frameCollectionView.isScrollEnabled = isOn
    }
    
    func changeCustomNavigationBarCharacters(alphaValue_infoUserLabel: CGFloat, tranformValue_infoUserLabel: CGAffineTransform, alphaValue_closeControllerButtonView: CGFloat, tranformValue_closeControllerButtonView: CGAffineTransform, alphaValue_yourGreatHeymessesButtonView: CGFloat, tranformValue_yourGreatHeymessesButtonView: CGAffineTransform, alphaValue_writingHeyMessButtonView: CGFloat, tranformValue_writingHeyMessButtonView: CGAffineTransform, writingHeyMessIsEnable: Bool) {
        UIView.animate(withDuration: 0.3) {
            let customNavigationBar = self.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView
            customNavigationBar?.yourGreatHeymessesButtonView.transform = tranformValue_yourGreatHeymessesButtonView
            customNavigationBar?.yourGreatHeymessesButtonView.alpha = alphaValue_yourGreatHeymessesButtonView
            customNavigationBar?.writingHeyMessButtonView.transform = tranformValue_writingHeyMessButtonView
            customNavigationBar?.writingHeyMessButtonView.alpha = alphaValue_writingHeyMessButtonView
            self.yourgreatheymessescontroller?.writingHeymessTapGesture.isEnabled = writingHeyMessIsEnable
            
            customNavigationBar?.infoUserLabel.transform = tranformValue_infoUserLabel
            customNavigationBar?.infoUserLabel.alpha = alphaValue_infoUserLabel
            customNavigationBar?.closeControllerButtonView.transform = tranformValue_closeControllerButtonView
            customNavigationBar?.closeControllerButtonView.alpha = alphaValue_closeControllerButtonView
        }
    }
    
    func changeCustomNavigationBar_addSettingsButtonView(alphaValue: CGFloat, tranformValue: CGAffineTransform) {
        let customNavigationBar = self.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView
        UIView.animate(withDuration: 0.3) {
            customNavigationBar?.settingsButtonView.alpha = alphaValue
            customNavigationBar?.settingsButtonView.transform = tranformValue
        }
    }
    
    @objc func handleCloseInfoUserController() {
        animationWhenDisappear()
    }
    
    @objc func handleOpenSettingsController() {
        print("Settings Controller")
        // When popup to this way, close this view that we need to self.view.removeFromSuperView()
        let settingscontroller = SettingsController()
        settingscontroller.infousercontroller = self
        self.addChildViewController(settingscontroller)
        settingscontroller.view.frame = self.view.frame
        self.view.addSubview(settingscontroller.view)
        settingscontroller.didMove(toParentViewController: self)
    }
    
    func animationWhenDisappear() {
        self.view.removeFromSuperview()
    }
}


















