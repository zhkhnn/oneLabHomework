//
//  AdaptiveViewController.swift
//  OneLab
//
//  Created by Aruzhan Zhakhan on 29.03.2023.
//

import UIKit
import SnapKit

class AdaptiveViewController: UIViewController {
    
    let blueView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        
        blueView.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(20)
            make.bottom.equalTo(bottomLayoutGuide.snp.top).inset(20)
            make.top.greaterThanOrEqualToSuperview().offset(20.0)
        }
        view.snp.makeConstraints { make in
            make.bottom.greaterThanOrEqualTo(blueView.snp.bottom).offset(20.0)
        }
        

        // Do any additional setup after loading the view.
    }
    

    

}
