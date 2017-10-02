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
    var writingHeymessTapGesture: UIGestureRecognizer!
    var refreshControl: UIRefreshControl!
    
    private let cellID0 = "CELLID0"
    private let cellID1 = "CELLID1"
    
    let tableViewX: UITableView = {
        let tableview = UITableView(frame: .zero, style: UITableViewStyle.grouped)
        tableview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return tableview
    }()
    
    let headerViewSectionHeymesses: HeaderViewSectionHeymesses = {
        let view = HeaderViewSectionHeymesses()
        view.label.text = "10 HEYMESSES"
        return view
    }()
    
    // MARK: - Life Cyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: - Function
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
        tableViewX.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10)
        
        refreshControl = UIRefreshControl()
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pulling happiness ...")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        tableViewX.addSubview(refreshControl)
        
        writingHeymessTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleWritingHeymess))
        framecontroller?.customNavigationBarView.writingHeyMessButtonView.addGestureRecognizer(writingHeymessTapGesture)
        
        tableViewX.delegate = self
        tableViewX.dataSource = self
        
        tableViewX.register(InfoUsersTableViewCell.self, forCellReuseIdentifier: cellID0)
        tableViewX.register(YourGreatHeyMessesTableViewCell.self, forCellReuseIdentifier: cellID1)
        
    }
    
    @objc func handleWritingHeymess() {
        print("Writing Heymess")
        // When popup to this way, close this view that we need to self.view.removeFromSuperView()
        let writingheymesscontroller = WritingHeymessController()
        writingheymesscontroller.yourgreateheymesscontroller = self
        self.addChildViewController(writingheymesscontroller)
        writingheymesscontroller.view.frame = self.view.frame
        self.view.addSubview(writingheymesscontroller.view)
        writingheymesscontroller.didMove(toParentViewController: self)
    }
    
    @objc func refresh() {
        // Code to refresh table view
        refreshControl.beginRefreshing()
        checkReachability()
        refreshControl.endRefreshing()
    }
    
    func checkReachability(){
        if currentReachabilityStatus == .reachableViaWiFi {
            print("User is connected to the internet via wifi.")
        }else if currentReachabilityStatus == .reachableViaWWAN{
            print("User is connected to the internet via WWAN.")
        } else {
            print("There is no internet connection")
            notificationWhenNoInternetConnection()
        }
    }
    
    func notificationWhenNoInternetConnection() {
        self.headerViewSectionHeymesses.internetCheckingView.transform = CGAffineTransform(scaleX: 1, y: 0.1)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            self.headerViewSectionHeymesses.internetCheckingView.alpha = 1
            self.headerViewSectionHeymesses.internetCheckingView.transform = CGAffineTransform.identity
        }, completion: { (done) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
                UIView.animate(withDuration: 0.3, animations: {
                    self.headerViewSectionHeymesses.internetCheckingView.alpha = 0
                    self.headerViewSectionHeymesses.internetCheckingView.transform = CGAffineTransform(scaleX: 1, y: 0.5)
                })
            })
        })
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
   
            cell.heyIDLabel.text = "15071997"
            cell.nameUserLabel.text = "Nguyễn Hữu Phong"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID1, for: indexPath) as! YourGreatHeyMessesTableViewCell
            
            cell.selectionStyle = .none
            
            cell.heymessLabel.text = "This is the very first time I have ever written a heymess on my new application, an app such as Sharahah but this is more interesting and amazing. You have 50% chance to anonymous onto each Heymess you send to your friends."
            cell.fromLabel.text = "Nguyễn Hữu Phong"
            
            
            return cell
        }
        
    }
    
    // MARK: - DELEGATE
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return self.view.frame.size.height/4
        } else {
            return self.view.frame.size.height/4
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return self.view.frame.size.height/20
        } else {
            return self.view.frame.size.height/16
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Hey You! Great day ♥"
        } else {
            return "10 Heymesses"
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        } else {
            return headerViewSectionHeymesses
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.5, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
}












