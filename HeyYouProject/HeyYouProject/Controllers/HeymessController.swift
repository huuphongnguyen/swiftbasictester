//
//  HeymessController.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/25/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class HeymessController: UIViewController {
    
    var yourgreatheymessescontroller: YourGreatHeyMessesController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    }
}
