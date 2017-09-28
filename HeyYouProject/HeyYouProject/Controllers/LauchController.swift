//
//  LauchController.swift
//  HeyYouProject
//
//  Created by Nguyen Huu Phong on 9/25/17.
//  Copyright © 2017 Nguyen Huu Phong. All rights reserved.
//

import UIKit
import LBTAComponents

class LauchController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        nextViewController()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    func nextViewController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let framecontroller = FrameController()
            self.present(framecontroller, animated: false, completion: {
                
            })
        }
    }
}












