import UIKit

public enum JNAttributedStringMaker {
    public enum Attribute {
        case bold
        case decimal
        case strikeThrough
    }

    public static func attributedString(
        text: String,
        textStyle: UIFont.TextStyle,
        fontColor: UIColor = .black,
        attributes: [Attribute] = []
    ) -> NSMutableAttributedString {
        let string = attributes.contains(.decimal) ? Self.decimalString(from: text) : text
        let attributedString = NSMutableAttributedString(string: string)

        var attributeDictionary: [NSAttributedString.Key : Any] = [:]
        attributeDictionary[.foregroundColor] = fontColor
        if attributes.contains(.bold) {
            attributeDictionary[.font] = Self.boldFont(textStyle: textStyle)
        } else {
            attributeDictionary[.font] = UIFont.preferredFont(forTextStyle: textStyle)
        }
        if attributes.contains(.strikeThrough) {
            attributeDictionary[.strikethroughStyle] = NSUnderlineStyle.single.rawValue
        }
        attributedString.addAttributes(
            attributeDictionary,
            range: NSMakeRange(0, attributedString.length)
        )
        
        return attributedString
    }
    
    private static func decimalString(from string: String) -> String {
        guard let number = Double(string) else { return string }
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        return numberformatter.string(from: NSNumber(value: number)) ?? string
    }
    
    private static func boldFont(textStyle: UIFont.TextStyle) -> UIFont {
        let font = UIFont.boldSystemFont(ofSize: textStyle.fontSize)
        return UIFontMetrics.default.scaledFont(for: font)
    }
}
