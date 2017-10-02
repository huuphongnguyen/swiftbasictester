//
//  WritingHeymessController.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/30/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents
import Lottie

class WritingHeymessController: UIViewController {
    
    var yourgreateheymesscontroller: YourGreatHeyMessesController?
    var close_writingHeymessController: UIGestureRecognizer!
    var send_Heymess: UIGestureRecognizer!
    
    let writingHeymessView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let infomationSendingView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let fromView: FromView = {
        let view = FromView()
        return view
    }()
    
    let toView: ToView = {
        let view = ToView()
        return view
    }()
    
    let heymessInputView: HeymessInputView = {
        let view = HeymessInputView()
        return view
    }()
    
    let whaleView: LOTAnimationView = {
        let lotview = LOTAnimationView(name: "whale")
        lotview.contentMode = .scaleAspectFill
        lotview.clipsToBounds = true
        lotview.loopAnimation = true
        lotview.alpha = 0
        return lotview
    }()
    
    let waveView: LOTAnimationView = {
        let lotview = LOTAnimationView(name: "WAVE")
        lotview.contentMode = .scaleAspectFill
        lotview.clipsToBounds = true
        lotview.loopAnimation = true
        lotview.alpha = 0
        lotview.animationSpeed = 0.2
        return lotview
    }()
    
    let checkGood: LOTAnimationView = {
        let lotview = LOTAnimationView(name: "checkCountText")
        lotview.contentMode = .scaleAspectFit
        lotview.alpha = 0
        return lotview
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        disableScrollingFrameController(isOn: false)
        animationWhenAppear()
        changeCustomNavigationBarCharacters(yourGreatHeymessesLabel_tranfromValue: CGAffineTransform(translationX: 0, y: -50), yourGreatHeymessesLabel_alphaValue: 0, writingHeyMessButtonView_tranformValue: CGAffineTransform(translationX: 50, y: 0), writingHeyMessButtonView_alphaValue: 0, writingHeymessLabel_tranformValue: CGAffineTransform.identity, writingHeymessLabel_alphaValue: 1, closeWritingControllerButtonView_tranformValue: CGAffineTransform.identity, closeWritingControllerButtonView_alphaValue: 1)
        changeCustomNavigationBar_addCountTextCharaterView(countTextCharacterView_tranformValue: CGAffineTransform.identity, countTextCharaterView_alphaValue: 1)
        
        changeCustomNavigationBar_addSendButtonView(sendButtonView_tranformValue: CGAffineTransform.identity, sendButtonView_alphaValue: 1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        disableScrollingFrameController(isOn: true)
    }
    
    // MARK: - Function
    func setupViews() {
        self.heymessInputView.input_heymess.delegate = self
        fromView.writingheymesscontroller = self
        
        close_writingHeymessController = UITapGestureRecognizer(target: self, action: #selector(handleCloseWritingHeymessController))
        self.yourgreateheymesscontroller?.framecontroller?.customNavigationBarView.closeWritingControllerButtonView.addGestureRecognizer(close_writingHeymessController)
        
        send_Heymess = UITapGestureRecognizer(target: self, action: #selector(handleSendHeyMess))
        self.yourgreateheymesscontroller?.framecontroller?.customNavigationBarView.sendButtonView.addGestureRecognizer(send_Heymess)
        
        self.toView.to_heyIdTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let marginValue = view.frame.size.height/20
        
        let width_writingHeymessView = view.frame.size.width * 19/20
        let height_writingHeymessView = view.frame.size.height * 1/2
        view.addSubview(writingHeymessView)
        writingHeymessView.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: marginValue, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: width_writingHeymessView, heightConstant: height_writingHeymessView)
        writingHeymessView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        writingHeymessView.layer.cornerRadius = width_writingHeymessView/20
        writingHeymessView.layer.masksToBounds = true
        
        let height_infomationSendingView = height_writingHeymessView * 1/3
        writingHeymessView.addSubview(infomationSendingView)
        infomationSendingView.anchor(writingHeymessView.topAnchor, left: writingHeymessView.leftAnchor, bottom: nil, right: writingHeymessView.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: height_infomationSendingView)
        
        writingHeymessView.addSubview(heymessInputView)
        heymessInputView.anchor(infomationSendingView.bottomAnchor, left: infomationSendingView.leftAnchor, bottom: writingHeymessView.bottomAnchor, right: infomationSendingView.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        let height_fromView = height_infomationSendingView/2
        infomationSendingView.addSubview(fromView)
        fromView.anchor(infomationSendingView.topAnchor, left: infomationSendingView.leftAnchor, bottom: nil, right: infomationSendingView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: height_fromView)
        
        infomationSendingView.addSubview(toView)
        toView.anchor(fromView.bottomAnchor, left: fromView.leftAnchor, bottom: infomationSendingView.bottomAnchor, right: fromView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        infomationSendingView.addSubview(checkGood)
        checkGood.anchor(nil, left: nil, bottom: nil, right: toView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 35, heightConstant: 35)
        checkGood.centerYAnchor.constraint(equalTo: toView.centerYAnchor).isActive = true
        
        writingHeymessView.addSubview(whaleView)
        whaleView.anchor(writingHeymessView.topAnchor, left: writingHeymessView.leftAnchor, bottom: writingHeymessView.bottomAnchor, right: writingHeymessView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        whaleView.transform = CGAffineTransform(translationX: -100, y: 0)
        
        let height_waveView = height_writingHeymessView/1.5
        writingHeymessView.addSubview(waveView)
        waveView.anchor(nil, left: writingHeymessView.leftAnchor, bottom: writingHeymessView.bottomAnchor, right: writingHeymessView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: height_waveView)
        waveView.transform = CGAffineTransform(translationX: 0, y: 50)
        
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
    
    func changeCustomNavigationBarCharacters(yourGreatHeymessesLabel_tranfromValue: CGAffineTransform, yourGreatHeymessesLabel_alphaValue: CGFloat, writingHeyMessButtonView_tranformValue: CGAffineTransform, writingHeyMessButtonView_alphaValue: CGFloat, writingHeymessLabel_tranformValue: CGAffineTransform, writingHeymessLabel_alphaValue: CGFloat, closeWritingControllerButtonView_tranformValue: CGAffineTransform, closeWritingControllerButtonView_alphaValue: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            let customNavigationBar = self.yourgreateheymesscontroller?.framecontroller?.customNavigationBarView
            customNavigationBar?.yourGreatHeymessesLabel.transform = yourGreatHeymessesLabel_tranfromValue
            customNavigationBar?.yourGreatHeymessesLabel.alpha = yourGreatHeymessesLabel_alphaValue
            customNavigationBar?.writingHeyMessButtonView.transform = writingHeyMessButtonView_tranformValue
            customNavigationBar?.writingHeyMessButtonView.alpha = writingHeyMessButtonView_alphaValue
            
            customNavigationBar?.writingHeymessLabel.transform = writingHeymessLabel_tranformValue
            customNavigationBar?.writingHeymessLabel.alpha = writingHeymessLabel_alphaValue
            customNavigationBar?.closeWritingControllerButtonView.transform = closeWritingControllerButtonView_tranformValue
            customNavigationBar?.closeWritingControllerButtonView.alpha = closeWritingControllerButtonView_alphaValue

        }
    }
    
    func changeCustomNavigationBar_addCountTextCharaterView(countTextCharacterView_tranformValue: CGAffineTransform, countTextCharaterView_alphaValue: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            let customNavigationBar = self.yourgreateheymesscontroller?.framecontroller?.customNavigationBarView
            customNavigationBar?.countTextCharacterView.transform = countTextCharacterView_tranformValue
            customNavigationBar?.countTextCharacterView.alpha = countTextCharaterView_alphaValue
        }
    }
    
    func changeCustomNavigationBar_addSendButtonView(sendButtonView_tranformValue: CGAffineTransform, sendButtonView_alphaValue: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            let customNavigationBar = self.yourgreateheymesscontroller?.framecontroller?.customNavigationBarView
            customNavigationBar?.sendButtonView.transform = sendButtonView_tranformValue
            customNavigationBar?.sendButtonView.alpha = sendButtonView_alphaValue
        }
    }
    
    @objc func handleCloseWritingHeymessController() {
        animationWhenDisappear()
        changeCustomNavigationBarCharacters(yourGreatHeymessesLabel_tranfromValue: CGAffineTransform.identity, yourGreatHeymessesLabel_alphaValue: 1, writingHeyMessButtonView_tranformValue: CGAffineTransform.identity, writingHeyMessButtonView_alphaValue: 1, writingHeymessLabel_tranformValue: CGAffineTransform(translationX: -50, y: 0), writingHeymessLabel_alphaValue: 0, closeWritingControllerButtonView_tranformValue: CGAffineTransform(translationX: -50, y: 0), closeWritingControllerButtonView_alphaValue: 0)
        changeCustomNavigationBar_addCountTextCharaterView(countTextCharacterView_tranformValue: CGAffineTransform(translationX: 0, y: -50), countTextCharaterView_alphaValue: 0)
        
        changeCustomNavigationBar_addSendButtonView(sendButtonView_tranformValue: CGAffineTransform(scaleX: 0.3, y: 0.3), sendButtonView_alphaValue: 0)
    }
    
    func animationWhenDisappear() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.transform = CGAffineTransform(translationX: 0, y: 50)
            self.view.alpha = 0
        }) { (animation) in
            self.view.removeFromSuperview()
        }
    }
    
    @objc func handleSendHeyMess() {
        checkBeforeSend()
    }
    
    func checkBeforeSend() {
        if self.toView.to_heyIdTextField.text?.characters.count != 7 || self.heymessInputView.input_heymess.text == "" {
            let messages = "Remember HeyID must have 7 characters \n your Heymess must have less than 157 characters"
            let alert = UIAlertController(title: "Something's wrong", message: messages, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK! Got it", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if self.toView.to_heyIdTextField.text == self.fromView.fromLabel.text {
            let messages = "Why do you want to send your Heymess to yourself? :D"
            let alert = UIAlertController(title: "Opps", message: messages, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Hahaha", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            send_Heymess.isEnabled = false
            close_writingHeymessController.isEnabled = false
            processSendToDatabase()
            animationWhenSuccessfullySend()
        }
    }
    
    func processSendToDatabase() {
        
    }
    
    func animationWhenSuccessfullySend() {
        let sendbuttonview = self.yourgreateheymesscontroller?.framecontroller?.customNavigationBarView.sendButtonView
        sendbuttonview?.play()
        whaleView.play()
        waveView.play()
        
        animationChangeToWhale(infomationSendingView_tranformValue: CGAffineTransform(scaleX: 0.8, y: 0.8), infomationSendingView_alphaValue: 0, inputView_tranformValue: CGAffineTransform(scaleX: 0.8, y: 0.8), inputView_alphaValue: 0, whaleView_tranformValue: CGAffineTransform.identity, whaleView_alphaValue: 1, heymessInputView_tranformValue: CGAffineTransform(scaleX: 0.5, y: 1), heymessInputView_alphaValue: 0, waveView_tranformValue: CGAffineTransform.identity, waveView_alphaValue: 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            UIView.animate(withDuration: 5, delay: 0, options: [], animations: {
                self.whaleView.transform = CGAffineTransform(translationX: 500, y: 0)
            }, completion: nil)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 11) {
            sendbuttonview?.stop()
            self.whaleView.stop()
            self.waveView.stop()
            self.animationChangeToWhale(infomationSendingView_tranformValue: CGAffineTransform.identity, infomationSendingView_alphaValue: 1, inputView_tranformValue: CGAffineTransform.identity, inputView_alphaValue: 1, whaleView_tranformValue: CGAffineTransform(translationX: -100, y: 0), whaleView_alphaValue: 0, heymessInputView_tranformValue: CGAffineTransform.identity, heymessInputView_alphaValue: 1, waveView_tranformValue: CGAffineTransform(translationX: 0, y: 50), waveView_alphaValue: 0)
            self.processAfterSendHeymess()
        }
    }
    
    func processAfterSendHeymess() {
        self.send_Heymess.isEnabled = true
        self.close_writingHeymessController.isEnabled = true
        self.toView.to_heyIdTextField.text = ""
        self.heymessInputView.input_heymess.text = ""
        self.checkGood.alpha = 0
        self.yourgreateheymesscontroller?.framecontroller?.customNavigationBarView.countTextCharacterLabel.text = "0/157"
    }
    
    func animationChangeToWhale(infomationSendingView_tranformValue: CGAffineTransform, infomationSendingView_alphaValue: CGFloat, inputView_tranformValue: CGAffineTransform, inputView_alphaValue: CGFloat, whaleView_tranformValue: CGAffineTransform, whaleView_alphaValue: CGFloat, heymessInputView_tranformValue: CGAffineTransform, heymessInputView_alphaValue: CGFloat, waveView_tranformValue: CGAffineTransform, waveView_alphaValue: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.infomationSendingView.transform = infomationSendingView_tranformValue
            self.infomationSendingView.alpha = infomationSendingView_alphaValue
            self.inputView?.transform = inputView_tranformValue
            self.inputView?.alpha = inputView_alphaValue
            self.heymessInputView.transform = heymessInputView_tranformValue
            self.heymessInputView.alpha = heymessInputView_alphaValue
        }
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            self.whaleView.transform = whaleView_tranformValue
        }, completion: nil)
        
        self.whaleView.alpha = whaleView_alphaValue
        
        UIView.animate(withDuration: 0.7) {
            self.waveView.transform = waveView_tranformValue
            self.waveView.alpha = waveView_alphaValue
        }
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if self.toView.to_heyIdTextField.text?.characters.count == 7 {
            self.checkGood.alpha = 1
            self.checkGood.play()
        } else {
            self.checkGood.alpha = 0
            self.checkGood.stop()
        }
    }
    
    func disableScrollingFrameController(isOn: Bool) {
        self.yourgreateheymesscontroller?.framecontroller?.frameCollectionView.isScrollEnabled = isOn
    }
}

extension WritingHeymessController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = self.heymessInputView.input_heymess.text ?? ""
        guard let stringRange = range.range(for: currentText) else { return false }
        
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        return changedText.characters.count <= 157
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        checkRemainCharacters()
    }
    
    func checkRemainCharacters() {
        let countCharacterTextView = self.heymessInputView.input_heymess.text.characters.count
    self.yourgreateheymesscontroller?.framecontroller?.customNavigationBarView.countTextCharacterLabel.text = String(countCharacterTextView) + "/157"
    }
    
    
    
}

















