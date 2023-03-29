import UIKit
import SnapKit

class ViewController: UIViewController {

        var imageView = UIImageView()
        var firstNameLabel = UILabel()
        var firstNameTextField = UITextField()
        var middleNameLabel = UILabel()
        var middleNameTextField = UITextField()
        var lastNameLabel = UILabel()
        var lastNameTextField = UITextField()
        var nameRowsStackView = UIStackView()
        var upperStackView = UIStackView()
        var textView = UITextView()
        var saveButton = UIButton()
        var cancelButton = UIButton()
        var clearButton = UIButton()
        var buttonsStackView = UIStackView()
        var rootStackView = UIStackView()
    

        override func viewDidLoad() {
            super.viewDidLoad()

            // Add subviews
            view.addSubview(rootStackView)
            view.backgroundColor = .brown
            rootStackView.addArrangedSubview(upperStackView)
            rootStackView.addArrangedSubview(textView)
            rootStackView.addArrangedSubview(buttonsStackView)
            upperStackView.addArrangedSubview(imageView)
            upperStackView.addArrangedSubview(nameRowsStackView)
            let firstNameStackView = createNameStackView(label: firstNameLabel, textField: firstNameTextField)
            let secondNameStackView = createNameStackView(label: middleNameLabel, textField: middleNameTextField)
            let lastNameStackView = createNameStackView(label: lastNameLabel, textField: lastNameTextField)
            nameRowsStackView.addArrangedSubview(firstNameStackView)
            nameRowsStackView.addArrangedSubview(secondNameStackView)
            nameRowsStackView.addArrangedSubview(lastNameStackView)
            buttonsStackView.addArrangedSubview(saveButton)
            buttonsStackView.addArrangedSubview(cancelButton)
            buttonsStackView.addArrangedSubview(clearButton)

            // Set properties
            textView.backgroundColor = .lightGray
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "flower")
            firstNameLabel.text = "First Name"
            middleNameLabel.text = "Middle Name"
            lastNameLabel.text = "Last Name"
            saveButton.setTitle("Save", for: .normal)
            cancelButton.setTitle("Cancel", for: .normal)
            clearButton.setTitle("Clear", for: .normal)
            imageView.snp.makeConstraints { make in
                make.height.equalTo(imageView.snp.width)
                
            }
            imageView.setContentHuggingPriority(UILayoutPriority(250), for: .vertical)
            imageView.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
            
            // Set the vertical and horizontal resistance
            imageView.setContentCompressionResistancePriority(UILayoutPriority(48), for: .vertical)
            imageView.setContentCompressionResistancePriority(UILayoutPriority(48), for: .horizontal)
            
            
            textView.setContentHuggingPriority(UILayoutPriority(249), for: .vertical)
            textView.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
            textView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
            textView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
            
            
            
            
            firstNameTextField.snp.makeConstraints { make in
                make.width.equalTo(middleNameTextField.snp.width)
                make.width.equalTo(lastNameTextField.snp.width)
            }
            rootStackView.snp.makeConstraints { make in
                make.leading.equalTo(view.snp.leadingMargin)
                make.trailing.equalTo(view.snp.trailingMargin)
                make.top.equalTo(topLayoutGuide.snp.bottom).offset(20)
                make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-20)
            }
            
            setLayoutLabels()
            setAxisDistributionSpacing()
            setLayoutTextField()
        }

        func createNameStackView(label: UILabel, textField: UITextField) -> UIStackView {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 8
            stackView.alignment = .firstBaseline
            stackView.distribution = .fill
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(textField)
            textField.borderStyle = .roundedRect
            return stackView
        }
    func setLayoutLabels(){
        firstNameLabel.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        firstNameLabel.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        firstNameLabel.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        firstNameLabel.setContentCompressionResistancePriority(UILayoutPriority(750), for: .horizontal)
        
        middleNameLabel.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        middleNameLabel.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        middleNameLabel.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        middleNameLabel.setContentCompressionResistancePriority(UILayoutPriority(750), for: .horizontal)
        
        lastNameLabel.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        lastNameLabel.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        lastNameLabel.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        lastNameLabel.setContentCompressionResistancePriority(UILayoutPriority(750), for: .horizontal)
    }
    func setAxisDistributionSpacing(){
        rootStackView.axis = .vertical
        rootStackView.alignment = .fill
        rootStackView.distribution = .fill
        rootStackView.spacing = 8
        nameRowsStackView.axis = .vertical
        nameRowsStackView.alignment = .fill
        nameRowsStackView.spacing = 8
        nameRowsStackView.distribution = .fill
        buttonsStackView.axis = .horizontal
        buttonsStackView.alignment = .firstBaseline
        buttonsStackView.spacing = 8
        buttonsStackView.distribution = .fillEqually
        upperStackView.axis = .horizontal
        upperStackView.alignment = .fill
        upperStackView.distribution = .fill
        upperStackView.spacing = 8
    }
    func setLayoutTextField(){
        firstNameTextField.setContentHuggingPriority(UILayoutPriority(250), for: .vertical)
        firstNameTextField.setContentHuggingPriority(UILayoutPriority(48), for: .horizontal)
        firstNameTextField.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        firstNameTextField.setContentCompressionResistancePriority(UILayoutPriority(749), for: .horizontal)
        
        middleNameTextField.setContentHuggingPriority(UILayoutPriority(250), for: .vertical)
        middleNameTextField.setContentHuggingPriority(UILayoutPriority(48), for: .horizontal)
        middleNameTextField.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        middleNameTextField.setContentCompressionResistancePriority(UILayoutPriority(749), for: .horizontal)
        
        lastNameTextField.setContentHuggingPriority(UILayoutPriority(250), for: .vertical)
        lastNameTextField.setContentHuggingPriority(UILayoutPriority(48), for: .horizontal)
        lastNameTextField.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        lastNameTextField.setContentCompressionResistancePriority(UILayoutPriority(749), for: .horizontal)
    }
    }

