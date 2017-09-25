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
    
    let customNavigationBar_InfoUserController: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationWhenAppear()
        disableScrollingFrameController(isOn: false)
        changeCustomNavigationBarCharacters(alphaValue_infoUserLabel: 1, tranformValue_infoUserLabel: CGAffineTransform.identity, alphaValue_closeInfoUserControllerButtonView: 1, tranformValue_closeInfoUserControllerButtonView: CGAffineTransform.identity, alphaValue_yourGreatHeymessesButtonView: 0, tranformValue_yourGreatHeymessesButtonView: CGAffineTransform(translationX: 0, y: 100), alphaValue_writingHeyMessButtonView: 0, tranformValue_writingHeyMessButtonView: CGAffineTransform(translationX: 0, y: 50))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        disableScrollingFrameController(isOn: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        changeCustomNavigationBarCharacters(alphaValue_infoUserLabel: 0, tranformValue_infoUserLabel: CGAffineTransform(translationX: 0, y: -100), alphaValue_closeInfoUserControllerButtonView: 0, tranformValue_closeInfoUserControllerButtonView: CGAffineTransform(translationX: 0, y: -50), alphaValue_yourGreatHeymessesButtonView: 1, tranformValue_yourGreatHeymessesButtonView: CGAffineTransform.identity, alphaValue_writingHeyMessButtonView: 1, tranformValue_writingHeyMessButtonView: CGAffineTransform.identity)
    }
    
    func setupViews() {
        
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        let closeController_tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCloseInfoUserController))
        self.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView.closeInfoUserControllerButtonView.addGestureRecognizer(closeController_tapGesture)
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
    
    func changeCustomNavigationBarCharacters(alphaValue_infoUserLabel: CGFloat, tranformValue_infoUserLabel: CGAffineTransform, alphaValue_closeInfoUserControllerButtonView: CGFloat, tranformValue_closeInfoUserControllerButtonView: CGAffineTransform, alphaValue_yourGreatHeymessesButtonView: CGFloat, tranformValue_yourGreatHeymessesButtonView: CGAffineTransform, alphaValue_writingHeyMessButtonView: CGFloat, tranformValue_writingHeyMessButtonView: CGAffineTransform) {
        UIView.animate(withDuration: 0.3) {
            let customNavigationBar = self.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView
            customNavigationBar?.yourGreatHeymessesButtonView.transform = tranformValue_yourGreatHeymessesButtonView
            customNavigationBar?.yourGreatHeymessesButtonView.alpha = alphaValue_yourGreatHeymessesButtonView
            customNavigationBar?.writingHeyMessButtonView.transform = tranformValue_writingHeyMessButtonView
            customNavigationBar?.writingHeyMessButtonView.alpha = alphaValue_writingHeyMessButtonView
            
            customNavigationBar?.infoUserLabel.transform = tranformValue_infoUserLabel
            customNavigationBar?.infoUserLabel.alpha = alphaValue_infoUserLabel
            customNavigationBar?.closeInfoUserControllerButtonView.transform = tranformValue_closeInfoUserControllerButtonView
            customNavigationBar?.closeInfoUserControllerButtonView.alpha = alphaValue_closeInfoUserControllerButtonView
        }
    }
    
    @objc func handleCloseInfoUserController() {
        self.view.removeFromSuperview()
    }
}


















