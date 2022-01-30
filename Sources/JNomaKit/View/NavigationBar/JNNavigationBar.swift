import UIKit

public class JNNavigationBar: UIView {
    enum LayoutAttribute {
        static let navigationBarHeight: CGFloat = 50
        static let largeSpacing: CGFloat = 10
        static let smallSpacing: CGFloat = 5
        static let buttonTextStyle: UIFont.TextStyle = .body
        static let mainLabelTextStyle: UIFont.TextStyle = .body
    }
    
    private var leftButton: UIButton? = nil
    private var mainLabel: UILabel? = nil
    private var rightButton: UIButton? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Left Button
    public func setLeftButton(title: String, action: Selector) {
        leftButton?.removeFromSuperview()
        let button = UIButton(type: .system)
        self.leftButton = button
        addSubview(button)
        configureLeftButton(title: title)
        leftButton?.addTarget(nil, action: action, for: .touchUpInside)
    }
    
    //MARK: - MainLabel
    public func setMainLabel(title: String) {
        mainLabel?.removeFromSuperview()
        let label = UILabel()
        self.mainLabel = label
        addSubview(label)
        configureMainLabel(title: title)
    }
    
    //MARK: - RightButton
    public func setRightButton(title: String, action: Selector) {
        rightButton?.removeFromSuperview()
        let button = UIButton(type: .system)
        self.rightButton = button
        addSubview(button)
        configureRightButton(title: title)
        rightButton?.addTarget(nil, action: action, for: .touchUpInside)
    }
}

//MARK: - Private Method
extension JNNavigationBar {
    //MARK: - Main View
    private func configure() {
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: topAnchor, constant: LayoutAttribute.navigationBarHeight)
        ])
    }
    
    //MARK: - Left Button
    private func configureLeftButton(title: String) {
        guard let leftButton = leftButton else { return }
        leftButton.setAttributedTitle(JNAttributedStringMaker.attributedString(
            text: title,
            textStyle: LayoutAttribute.buttonTextStyle,
            fontColor: .systemBlue
        ), for: .normal)
        leftButton.titleLabel?.textAlignment = .left
        leftButton.titleLabel?.adjustsFontForContentSizeCategory = true
        leftButton.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    //MARK: - MainLabel
    private func configureMainLabel(title: String) {
        guard let mainLabel = mainLabel else { return }
        mainLabel.attributedText = JNAttributedStringMaker.attributedString(
            text: title,
            textStyle: LayoutAttribute.mainLabelTextStyle,
            fontColor: .black,
            attributes: [.bold]
        )
        mainLabel.adjustsFontForContentSizeCategory = true
        mainLabel.textAlignment = .center
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    //MARK: - RightButton
    private func configureRightButton(title: String) {
        guard let rightButton = rightButton else { return }
        rightButton.setAttributedTitle(JNAttributedStringMaker.attributedString(
            text: title,
            textStyle: LayoutAttribute.buttonTextStyle,
            fontColor: .systemBlue
        ), for: .normal)
        rightButton.titleLabel?.textAlignment = .right
        rightButton.titleLabel?.adjustsFontForContentSizeCategory = true
        rightButton.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

