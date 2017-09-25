//
//  YourGreatHeyMessesController.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/24/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class YourGreatHeyMessesController: UIViewController {
    
    var framecontroller: FrameController?
    
    private let cellID0 = "CELLID0"
    private let cellID1 = "CELLID1"
    
    let tableViewX: UITableView = {
        let tableview = UITableView(frame: .zero, style: UITableViewStyle.grouped)
        tableview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTableView()
    }
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(tableViewX)
        tableViewX.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
    func setupTableView() {
        let window = UIApplication.shared.keyWindow
        let marginValue = (window?.frame.size.height)!/12
        
        tableViewX.contentInset = UIEdgeInsetsMake(marginValue/2, 0, marginValue, 0)
        tableViewX.showsVerticalScrollIndicator = false
        tableViewX.separatorStyle = .none
        
        let writingHeymessTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleWritingHeymess))
        framecontroller?.customNavigationBarView.writingHeyMessButtonView.addGestureRecognizer(writingHeymessTapGesture)
        
        tableViewX.delegate = self
        tableViewX.dataSource = self
        
        tableViewX.register(InfoUsersTableViewCell.self, forCellReuseIdentifier: cellID0)
        tableViewX.register(YourGreatHeyMessesTableViewCell.self, forCellReuseIdentifier: cellID1)
        
    }
    
    @objc func handleWritingHeymess() {
        print("Writing Heymess")
    }
}

extension YourGreatHeyMessesController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - DATASOURE
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID0, for: indexPath) as! InfoUsersTableViewCell
            
            cell.selectionStyle = .none
            
            cell.textLabel?.text = "0"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID1, for: indexPath) as! YourGreatHeyMessesTableViewCell
            
            cell.selectionStyle = .none
            
            cell.textLabel?.text = "1"
            
            return cell
        }
        
    }
    
    // MARK: - DELEGATE
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return self.view.frame.size.height/5
        } else {
            return self.view.frame.size.height/5
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return self.view.frame.size.height/20
        } else {
            return self.view.frame.size.height/20
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Hey You! Great day ♥"
        } else {
            return "10 Heymesses"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            // When popup to this way, close this view that we need to self.view.removeFromSuperView()
            let infousercontroller = InfoUserController()
            infousercontroller.yourgreatheymessescontroller = self
            self.addChildViewController(infousercontroller)
            infousercontroller.view.frame = self.view.frame
            self.view.addSubview(infousercontroller.view)
            infousercontroller.didMove(toParentViewController: self)
        } else {
            // When popup to this way, close this view that we need to self.view.removeFromSuperView()
            let heymesscontroller = HeymessController()
            heymesscontroller.yourgreatheymessescontroller = self
            self.addChildViewController(heymesscontroller)
            heymesscontroller.view.frame = self.view.frame
            self.view.addSubview(heymesscontroller.view)
            heymesscontroller.didMove(toParentViewController: self)
        }
    }
}












