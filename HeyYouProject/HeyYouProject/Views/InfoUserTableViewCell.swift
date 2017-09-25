//
//  InfoUserTableViewCell.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/25/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class InfoUsersTableViewCell: UITableViewCell {
    
    let profileUserImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.isUserInteractionEnabled = false
        return imageview
    }()
    
    let infoView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let heyIDLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        label.textAlignment = .right
        label.numberOfLines = 1
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.isUserInteractionEnabled = false
        return label
    }()
    
    let nameUserLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        label.textAlignment = .right
        label.numberOfLines = 1
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.isUserInteractionEnabled = false
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
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let width_profileUserImageView = (frame.size.height * 9/10)*2
        let height_profileUserImageView = width_profileUserImageView
        addSubview(profileUserImageView)
        profileUserImageView.anchor(nil, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: width_profileUserImageView, heightConstant: height_profileUserImageView)
        profileUserImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileUserImageView.layer.cornerRadius = width_profileUserImageView/2
        profileUserImageView.layer.masksToBounds = true
        
        let height_infoView = (frame.size.height * 9/10)*2
        addSubview(infoView)
        infoView.anchor(nil, left: profileUserImageView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: height_infoView)
        infoView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        let height_heyIDLabel = height_infoView/2
        infoView.addSubview(heyIDLabel)
        heyIDLabel.anchor(infoView.topAnchor, left: infoView.leftAnchor, bottom: nil, right: infoView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: height_heyIDLabel)

        infoView.addSubview(nameUserLabel)
        nameUserLabel.anchor(heyIDLabel.bottomAnchor, left: infoView.leftAnchor, bottom: infoView.bottomAnchor, right: infoView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
















