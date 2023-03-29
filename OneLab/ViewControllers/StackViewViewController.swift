//
//  MainViewController.swift
//  OneLab
//
//  Created by Aruzhan Zhakhan on 28.03.2023.
//

import UIKit

class StackViewViewController: UIViewController {

    let flowersLabel = UILabel()
    let imageView = UIImageView()
    let editButton = UIButton(type: .system)
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        view.backgroundColor = .white
        
        stackView.addArrangedSubview(flowersLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(editButton)
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        flowersLabel.text = "Flowers"
        flowersLabel.textColor = .black
        flowersLabel.textAlignment = .center
        imageView.image = UIImage(named: "flower")
        imageView.contentMode = .scaleAspectFit
        editButton.setTitle("Edit", for: .normal)

        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(20)
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-20)
        }
        
        
        
        // Set the vertical and horizontal hugging
        imageView.setContentHuggingPriority(UILayoutPriority(249), for: .vertical)
        imageView.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
        
        // Set the vertical and horizontal resistance
        imageView.setContentCompressionResistancePriority(UILayoutPriority(749), for: .vertical)
        imageView.setContentCompressionResistancePriority(UILayoutPriority(750), for: .horizontal)
    }

}
