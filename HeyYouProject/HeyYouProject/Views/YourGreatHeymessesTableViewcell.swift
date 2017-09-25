//
//  YourGreatHeymessesTableViewCell.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/25/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class YourGreatHeyMessesTableViewCell: UITableViewCell {
    
    let heymessLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.ultraLight)
        label.isUserInteractionEnabled = false
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let fromLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.isUserInteractionEnabled = false
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
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
        
        let width_heymessLabel = frame.size.width - 20
        addSubview(heymessLabel)
        heymessLabel.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: frame.size.height*7/8, rightConstant: 0, widthConstant: width_heymessLabel, heightConstant: 0)
        heymessLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        let width_fromLabel = frame.size.width*2/3
        let height_fromLabel = frame.size.height - heymessLabel.frame.size.height - 20
        addSubview(fromLabel)
        fromLabel.anchor(nil, left: nil, bottom: bottomAnchor, right: heymessLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 10, rightConstant: 0, widthConstant: width_fromLabel, heightConstant: height_fromLabel)
        fromLabel.layer.cornerRadius = height_fromLabel/2
        fromLabel.layer.masksToBounds = true
    }
}











