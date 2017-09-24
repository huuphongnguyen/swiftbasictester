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
    
    private let cellID = "CELLID"
    
    let tableViewX: UITableView = {
        let tableview = UITableView()
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
        
        tableViewX.delegate = self
        tableViewX.dataSource = self
        
        tableViewX.register(YourGreatHeyMessesTableViewCell.self, forCellReuseIdentifier: cellID)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! YourGreatHeyMessesTableViewCell
            cell.textLabel?.text = "\(indexPath.row)"
            return cell
        }
        
    }
    
    // MARK: - DELEGATE
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 0
        } else {
            return self.view.frame.size.height/6
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "YOUR HEYMESSES"
        } else {
            return ""
        }
    }
    
    
}

class YourGreatHeyMessesTableViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}








