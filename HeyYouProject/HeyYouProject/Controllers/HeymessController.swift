//
//  HeymessController.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/25/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class HeymessController: UIViewController {
    
    var yourgreatheymessescontroller: YourGreatHeyMessesController?
    var closeController_tapGesture: UIGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationWhenAppear()
        disableScrollingFrameController(isOn: false)
        changeCustomNavigationBarCharacters(alphaValue_heymessLabel: 1, tranformValue_heymessLabel: CGAffineTransform.identity, alphaValue_closeControllerButtonView: 1, tranformValue_closeControllerButtonView: CGAffineTransform.identity, alphaValue_yourGreatHeymessesButtonView: 0, tranformValue_yourGreatHeymessesButtonView: CGAffineTransform(translationX: 0, y: 50), alphaValue_writingHeyMessButtonView: 0, tranformValue_writingHeyMessButtonView: CGAffineTransform(translationX: 0, y: 50), writingHeyMessIsEnable: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        changeCustomNavigationBarCharacters(alphaValue_heymessLabel: 0, tranformValue_heymessLabel: CGAffineTransform(translationX: 0, y: -50), alphaValue_closeControllerButtonView: 0, tranformValue_closeControllerButtonView: CGAffineTransform(translationX: 0, y: -50), alphaValue_yourGreatHeymessesButtonView: 1, tranformValue_yourGreatHeymessesButtonView: CGAffineTransform.identity, alphaValue_writingHeyMessButtonView: 1, tranformValue_writingHeyMessButtonView: CGAffineTransform.identity, writingHeyMessIsEnable: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        disableScrollingFrameController(isOn: true)
    }
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        closeController_tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCloseHeymessController))
        self.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView.closeControllerButtonView.addGestureRecognizer(closeController_tapGesture)
    }
    
    func disableScrollingFrameController(isOn: Bool) {
        self.yourgreatheymessescontroller?.framecontroller?.frameCollectionView.isScrollEnabled = isOn
    }
    
    func changeCustomNavigationBarCharacters(alphaValue_heymessLabel: CGFloat, tranformValue_heymessLabel: CGAffineTransform, alphaValue_closeControllerButtonView: CGFloat, tranformValue_closeControllerButtonView: CGAffineTransform, alphaValue_yourGreatHeymessesButtonView: CGFloat, tranformValue_yourGreatHeymessesButtonView: CGAffineTransform, alphaValue_writingHeyMessButtonView: CGFloat, tranformValue_writingHeyMessButtonView: CGAffineTransform, writingHeyMessIsEnable: Bool) {
        UIView.animate(withDuration: 0.3) {
            let customNavigationBar = self.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView
            customNavigationBar?.yourGreatHeymessesButtonView.transform = tranformValue_yourGreatHeymessesButtonView
            customNavigationBar?.yourGreatHeymessesButtonView.alpha = alphaValue_yourGreatHeymessesButtonView
            customNavigationBar?.writingHeyMessButtonView.transform = tranformValue_writingHeyMessButtonView
            customNavigationBar?.writingHeyMessButtonView.alpha = alphaValue_writingHeyMessButtonView
            self.yourgreatheymessescontroller?.writingHeymessTapGesture.isEnabled = writingHeyMessIsEnable
            
            customNavigationBar?.heymessLabel.transform = tranformValue_heymessLabel
            customNavigationBar?.heymessLabel.alpha = alphaValue_heymessLabel
            customNavigationBar?.closeControllerButtonView.transform = tranformValue_closeControllerButtonView
            customNavigationBar?.closeControllerButtonView.alpha = alphaValue_closeControllerButtonView
        }
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
    
    @objc func handleCloseHeymessController() {
        animationWhenDisappear()
    }
    
    func animationWhenDisappear() {
        self.view.removeFromSuperview()
    }
}












