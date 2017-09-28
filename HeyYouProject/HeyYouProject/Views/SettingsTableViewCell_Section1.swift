//
//  SettingsTableViewCell_Section1.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/27/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class SettingsTableViewCell_Section1: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}



