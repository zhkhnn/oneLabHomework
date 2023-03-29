import UIKit
import SnapKit

class ItemViewController: UIViewController {

    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let addItemButton = UIButton()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview()
            make.bottom.equalTo(bottomLayoutGuide.snp.bottom).offset(-20)
        }
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.top.equalTo(scrollView.snp.top)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.width.equalTo(scrollView.snp.width)
        }
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        
        addItemButton.setTitle("Add item", for: .normal)
        stackView.addArrangedSubview(addItemButton)
        
        let insets = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
        
//        for _ in 0..<5 {
//                    let entryView = createEntry()
//                    stackView.addArrangedSubview(entryView)
//                    entryView.snp.makeConstraints { make in
//                        make.height.equalTo(100) // Set a fixed height for the entry view
//                        make.leading.equalToSuperview()
//                        make.trailing.equalToSuperview()
//                    }
//                }
        addItemButton.addTarget(self, action: #selector(addEntry), for: .touchUpInside)
        addItemButton.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.top.equalTo(stackView.snp.bottom).offset(16)
                    make.bottom.lessThanOrEqualToSuperview().offset(-16)
                }
        
    }
    @objc func addEntry() {
        
        let stack = stackView
        let index = stack.arrangedSubviews.count - 1
        let addView = stack.arrangedSubviews[index]
        
        let scroll = scrollView
        let offset = CGPoint(x: scroll.contentOffset.x,
                             y: scroll.contentOffset.y + addView.frame.size.height)
        
        let newView = createEntry()
        newView.isHidden = true
        stack.insertArrangedSubview(newView, at: index)
        
        UIView.animate(withDuration: 0.25) { () -> Void in
            newView.isHidden = false
            scroll.contentOffset = offset
        }
    }
    
    private func createEntry() -> UIView {
        let date = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .short, timeStyle: .none)
        let number = "\(randomHexQuad())-\(randomHexQuad())-\(randomHexQuad())-\(randomHexQuad())"
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .firstBaseline
        stack.distribution = .fill
        stack.spacing = 8
        
        let dateLabel = UILabel()
        dateLabel.text = date
        dateLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        
        let deleteButton = UIButton(type: .roundedRect)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.addTarget(self, action: #selector(self.deleteStackView), for: .touchUpInside)
        
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(deleteButton)
        
        return stack
    }
    @objc func deleteStackView(sender: UIButton) {
        if let view = sender.superview {
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                view.isHidden = true
            }, completion: { (success) -> Void in
                view.removeFromSuperview()
            })
        }
    }
     
    private func randomHexQuad() -> String {
        return NSString(format: "%X%X%X%X",
                        arc4random() % 16,
                        arc4random() % 16,
                        arc4random() % 16,
                        arc4random() % 16
            ) as String
    }
    }

//    @objc func addEntry() {
//            let entryView = createEntry()
//            stackView.addArrangedSubview(entryView)
//            entryView.snp.makeConstraints { make in
//                make.height.equalTo(100) // Set a fixed height for the entry view
//                make.leading.equalToSuperview()
//                make.trailing.equalToSuperview()
//            }
//            scrollView.scrollToBottom(animated: true)
//        }
//    func createEntry() -> UIView {
//            // Create and return a new entry view here
//            let entryView = UIView()
//            entryView.backgroundColor = .red
//            return entryView
//        }

//private extension UIScrollView {
//    func scrollToBottom(animated: Bool) {
//        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
//        setContentOffset(bottomOffset, animated: animated)
//    }
//}
