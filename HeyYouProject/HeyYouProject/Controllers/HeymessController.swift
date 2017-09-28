//
//  HeymessController.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/25/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents
import Lottie

class HeymessController: UIViewController {
    
    var yourgreatheymessescontroller: YourGreatHeyMessesController?
    var closeController_tapGesture: UIGestureRecognizer!
    
    let captureView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return view
    }()
    
    let fromLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Nguyen Huu Phong"
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.sizeToFit()
        return label
    }()
    
    let heymessLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.text = "This is the first HeyMess text in heymess application and it's really fucking awesome, This is the first HeyMess text in heymess application and it's really fucking awesome. This is the first HeyMess text in heymess application and it's really fucking awesome, This is the first HeyMess text in heymess application and it's really fucking awesome."
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.light)
        label.isUserInteractionEnabled = false
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let likeImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.isUserInteractionEnabled = false
        imageview.image = UIImage(named: "Liked")
        imageview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imageview.alpha = 0
        return imageview
    }()
    
    let boredImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.isUserInteractionEnabled = false
        imageview.image = UIImage(named: "Bored")
        imageview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imageview.alpha = 1
        return imageview
    }()
    
    let likeView: LOTAnimationView = {
        let lotview = LOTAnimationView(name: "likeButton")
        lotview.alpha = 0
        lotview.isUserInteractionEnabled = false
        lotview.contentMode = .scaleAspectFill
        lotview.clipsToBounds = true
        return lotview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationWhenAppear()
        disableScrollingFrameController(isOn: false)
        changeCustomNavigationBarCharacters(alphaValue_heymessLabel: 1, tranformValue_heymessLabel: CGAffineTransform.identity, alphaValue_closeControllerButtonView: 1, tranformValue_closeControllerButtonView: CGAffineTransform.identity, alphaValue_yourGreatHeymessesButtonView: 0, tranformValue_yourGreatHeymessesButtonView: CGAffineTransform(translationX: 0, y: 50), alphaValue_writingHeyMessButtonView: 0, tranformValue_writingHeyMessButtonView: CGAffineTransform(translationX: 0, y: 50), writingHeyMessIsEnable: false)
        changeCustomNavigationBar_addShareHeymessButtonView(alphaValue: 1, tranformValue: CGAffineTransform.identity)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        disableScrollingFrameController(isOn: true)
    }
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        closeController_tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCloseHeymessController))
        self.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView.closeControllerButtonView.addGestureRecognizer(closeController_tapGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        tapGesture.numberOfTapsRequired = 2
        backgroundView.addGestureRecognizer(tapGesture)
        
        self.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView.shareHeymessButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShareImage)))
        
        let width_captureView = view.frame.size.width
        let height_captureView = view.frame.size.height
        view.addSubview(captureView)
        captureView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: width_captureView, heightConstant: height_captureView)
        
        let height_backgroundView = height_captureView * 2/3
        captureView.addSubview(backgroundView)
        backgroundView.anchor(nil, left: captureView.leftAnchor, bottom: nil, right: captureView.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: height_backgroundView)
        backgroundView.centerYAnchor.constraint(equalTo: captureView.centerYAnchor).isActive = true
        backgroundView.layer.cornerRadius = width_captureView/20
        backgroundView.layer.masksToBounds = true
        
        let height_fromLabel = height_backgroundView/8
        backgroundView.addSubview(fromLabel)
        fromLabel.anchor(nil, left: backgroundView.leftAnchor, bottom: backgroundView.bottomAnchor, right: backgroundView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: height_fromLabel)
        fromLabel.layer.cornerRadius = height_fromLabel/2
        fromLabel.layer.masksToBounds = true
        
        let width_boredImageView = height_backgroundView/8
        let height_boredImageview = width_boredImageView
        backgroundView.addSubview(boredImageView)
        boredImageView.anchor(backgroundView.topAnchor, left: nil, bottom: nil, right: backgroundView.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: width_boredImageView, heightConstant: height_boredImageview)
        boredImageView.layer.cornerRadius = width_boredImageView/2
        boredImageView.layer.masksToBounds = true
        
        let width_likeImageView = height_backgroundView/8
        let height_likeImageview = width_likeImageView
        backgroundView.addSubview(likeImageView)
        likeImageView.anchor(backgroundView.topAnchor, left: nil, bottom: nil, right: backgroundView.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: width_likeImageView, heightConstant: height_likeImageview)
        likeImageView.layer.cornerRadius = width_likeImageView/2
        likeImageView.layer.masksToBounds = true
        
        backgroundView.addSubview(heymessLabel)
        heymessLabel.anchor(likeImageView.bottomAnchor, left: backgroundView.leftAnchor, bottom: fromLabel.topAnchor, right: backgroundView.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        let width_likeView = width_captureView
        let height_likeView = width_likeView
        view.addSubview(likeView)
        likeView.anchor(nil, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: width_likeView, heightConstant: height_likeView)
        likeView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        likeView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
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
    
    func changeCustomNavigationBar_addShareHeymessButtonView(alphaValue: CGFloat, tranformValue: CGAffineTransform) {
        let customNavigationBar = self.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView
        UIView.animate(withDuration: 0.3) {
            customNavigationBar?.shareHeymessButtonView.alpha = alphaValue
            customNavigationBar?.shareHeymessButtonView.transform = tranformValue
        }
    }
    
    func animationWhenAppear() {
        self.view.transform = CGAffineTransform(translationX: 0, y: 50)
        self.view.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.view.transform = CGAffineTransform.identity
            self.view.alpha = 1
        }) { (animation) in
            
        }
    }
    
    @objc func handleCloseHeymessController() {
        animationWhenDisappear()
        changeCustomNavigationBarCharacters(alphaValue_heymessLabel: 0, tranformValue_heymessLabel: CGAffineTransform(translationX: 0, y: -50), alphaValue_closeControllerButtonView: 0, tranformValue_closeControllerButtonView: CGAffineTransform(translationX: 0, y: -50), alphaValue_yourGreatHeymessesButtonView: 1, tranformValue_yourGreatHeymessesButtonView: CGAffineTransform.identity, alphaValue_writingHeyMessButtonView: 1, tranformValue_writingHeyMessButtonView: CGAffineTransform.identity, writingHeyMessIsEnable: true)
        changeCustomNavigationBar_addShareHeymessButtonView(alphaValue: 0, tranformValue: CGAffineTransform(translationX: 0, y: 50))
    }
    
    func animationWhenDisappear() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.transform = CGAffineTransform(translationX: 0, y: 50)
            self.view.alpha = 0
        }) { (animation) in
            self.view.removeFromSuperview()
        }
    }
    
    @objc func handleTapGesture() {
        print("tap tap tap")
        self.likeView.alpha = 1
        self.likeView.play()
        self.captureView.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            UIView.animate(withDuration: 0.3, animations: {
                self.likeView.alpha = 0
                self.captureView.alpha = 1
                self.likeImageView.alpha = 1
                self.likeImageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }, completion: { (animate) in
                self.likeView.stop()
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
                    self.likeImageView.transform = CGAffineTransform.identity
                }, completion: nil)
            })
        }
    }
    
    @objc func handleShareImage() {
        print("share")
        let imageCapture = captureView.pb_takeSnapshot()
        //UIImageWriteToSavedPhotosAlbum(imageCapture, nil, nil, nil)
        
        let imageToShare = [ imageCapture ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
}












