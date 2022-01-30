import UIKit

public class JNSegmentedControl: UISegmentedControl {
    override init(items: [Any]?) {
        super.init(items: items)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public convenience init(items: [Any]?, color: UIColor, textStyle: UIFont.TextStyle) {
        self.init(items: items)
        configure(color: color, textStyle: textStyle)
    }
}

//MARK: - Private Method
extension JNSegmentedControl {
    private func configure(color: UIColor, textStyle: UIFont.TextStyle) {
        let selectedAttribute: [NSAttributedString.Key : Any] = [
            .font : UIFont.preferredFont(forTextStyle: textStyle),
            .foregroundColor : color
        ]
        let normalAttribute: [NSAttributedString.Key : Any] = [
            .font : UIFont.preferredFont(forTextStyle: textStyle),
            .foregroundColor : UIColor.white
        ]
        setTitleTextAttributes(selectedAttribute, for: .selected)
        setTitleTextAttributes(normalAttribute, for: .normal)
        
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
        selectedSegmentTintColor = .white
        backgroundColor = color
        selectedSegmentIndex = 0
    }
}

