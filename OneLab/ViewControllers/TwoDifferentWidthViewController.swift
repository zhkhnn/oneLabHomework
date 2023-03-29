//
//  TwoDifferentWidthViewController.swift
//  OneLab
//
//  Created by Aruzhan Zhakhan on 29.03.2023.
//

import UIKit
import SnapKit

class TwoDifferentWidthViewController: UIViewController {

    let purpleView = UIView()
    let orangeView = UIView()

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(purpleView)
        view.addSubview(orangeView)
        purpleView.backgroundColor = .purple
        orangeView.backgroundColor = .orange
        
        purpleView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(view.layoutMargins.left)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(20.0)
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-20.0)
        }
        let multiplier: CGFloat = 2.0
        orangeView.snp.makeConstraints { make in
            make.leading.equalTo(purpleView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(view.layoutMargins.right)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(20.0)
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-20.0)
            make.width.equalTo(purpleView.snp.width).multipliedBy(multiplier)
        }

        
        // Do any additional setup after loading the view.
    }
    


}
