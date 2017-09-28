//
//  SettingsController.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/26/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class SettingsController: UIViewController {
    
    var infousercontroller: InfoUserController?
    var closeController_tapGesture: UITapGestureRecognizer!
    
    let angle =  CGFloat(Double.pi*2)
    let angleX = -CGFloat(Double.pi)
    
    private let cellID0 = "CELLID0"
    private let cellID1 = "CELLID1"
    
    lazy var tableViewY: UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let window = UIApplication.shared.keyWindow
        let marginValue = (window?.frame.size.height)!/12
        
        tableview.contentInset = UIEdgeInsetsMake(marginValue/2, 0, marginValue, 0)
        
        tableview.showsVerticalScrollIndicator = false
        
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(SettingsTableViewCell_Section0.self, forCellReuseIdentifier: cellID0)
        tableview.register(SettingsTableViewCell_Section1.self, forCellReuseIdentifier: cellID1)
        
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeCustomNavigationBarCharacters(tranformValue_settingsButtonView: CGAffineTransform(translationX: 0, y: -50), alphaValue_settingsButtonView: 0, tranformValue_closeControllerButtonView: CGAffineTransform(rotationAngle: self.angle), tranformValue_settingsLabel: CGAffineTransform.identity, alphaValue_settingsLabel: 1, tranformValue_infoUserLabel: CGAffineTransform(translationX: 0, y: 50), alphaValue_infoUserLabel: 0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        changeCustomNavigationBarCharacters(tranformValue_settingsButtonView: CGAffineTransform.identity, alphaValue_settingsButtonView: 1, tranformValue_closeControllerButtonView: CGAffineTransform(rotationAngle: -self.angleX), tranformValue_settingsLabel: CGAffineTransform(translationX: 0, y: -50), alphaValue_settingsLabel: 0, tranformValue_infoUserLabel: CGAffineTransform.identity, alphaValue_infoUserLabel: 1)
    }
    
    func setupViews() {
        UIView.animate(withDuration: 0.5) {
            self.infousercontroller?.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView.closeControllerButtonView.transform = CGAffineTransform(rotationAngle: self.angle/2)
        }

        
        view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        
        closeController_tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCloseSettingController))
        self.infousercontroller?.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView.closeControllerButtonView.addGestureRecognizer(closeController_tapGesture)
        
        view.addSubview(tableViewY)
        tableViewY.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func changeCustomNavigationBarCharacters(tranformValue_settingsButtonView: CGAffineTransform, alphaValue_settingsButtonView: CGFloat, tranformValue_closeControllerButtonView: CGAffineTransform, tranformValue_settingsLabel: CGAffineTransform, alphaValue_settingsLabel: CGFloat, tranformValue_infoUserLabel: CGAffineTransform, alphaValue_infoUserLabel: CGFloat) {
        let customNavigationBar = infousercontroller?.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView
        
        UIView.animate(withDuration: 0.5) {
            customNavigationBar?.settingsButtonView.transform = tranformValue_settingsButtonView
            customNavigationBar?.settingsButtonView.alpha = alphaValue_settingsButtonView
            
            customNavigationBar?.closeControllerButtonView.transform = tranformValue_closeControllerButtonView
            
            customNavigationBar?.settingsLabel.transform = tranformValue_settingsLabel
            customNavigationBar?.settingsLabel.alpha = alphaValue_settingsLabel
            
            customNavigationBar?.infoUserLabel.transform = tranformValue_infoUserLabel
            customNavigationBar?.infoUserLabel.alpha = alphaValue_infoUserLabel
        }
    }
    
    @objc func handleCloseSettingController() {
        self.view.removeFromSuperview()
        addGestureAgainForCloseControllerButtonView_inInfoUserController()
    }
    
    func addGestureAgainForCloseControllerButtonView_inInfoUserController() {
        var addGestureAgainForCloseControllerButtonView: UIGestureRecognizer = (infousercontroller?.closeController_tapGesture)!
        addGestureAgainForCloseControllerButtonView = UITapGestureRecognizer(target: self, action: #selector(handleCloseInfoUserController))
        infousercontroller?.yourgreatheymessescontroller?.framecontroller?.customNavigationBarView.closeControllerButtonView.addGestureRecognizer(addGestureAgainForCloseControllerButtonView)
    }
    
    @objc func handleCloseInfoUserController() {
        infousercontroller?.handleCloseInfoUserController()
    }
}

extension SettingsController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID0, for: indexPath) as! SettingsTableViewCell_Section0
            cell.textLabel?.text = "Fuck"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID1, for: indexPath) as! SettingsTableViewCell_Section1
            cell.textLabel?.text = "Ok it work"
            return cell
        }
    }
    
    // MARK: - Delegate
    
}











