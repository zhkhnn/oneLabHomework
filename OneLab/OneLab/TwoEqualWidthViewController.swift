//
//  TwoEqualWidthViewController.swift
//  OneLab
//
//  Created by Aruzhan Zhakhan on 29.03.2023.
//

import UIKit

class TwoEqualWidthViewController: UIViewController {
    let yellowView = UIView()
    let greenView = UIView()

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(yellowView)
        view.addSubview(greenView)
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        
        yellowView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(view.layoutMargins.left)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(20.0)
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-20.0)
        }

        greenView.snp.makeConstraints { make in
            make.leading.equalTo(yellowView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(view.layoutMargins.right)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(20.0)
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-20.0)
            make.width.equalTo(yellowView.snp.width)
        }

        
        // Do any additional setup after loading the view.
    }
    

    

}
