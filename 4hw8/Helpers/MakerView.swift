//
//  MakerView.swift
//  4hw8
//
//  Created by Telegey Nurbekova on 08/03/24.
//

import UIKit

final class MakerView {
    
    static let shared = MakerView()
    
    private init(){
        print("init MakerView")
    }
    
    func makerImage(imageName: String = "",
                    translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: imageName)
        image.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return image
    }
    
    func makerLabel(text: String = "",
                    font: UIFont = Fonts.regular.size(20),
                    textColor: UIColor = .white,
                    backgroundColor: UIColor = .clear,
                    textAlignment: NSTextAlignment = .center,
                    numberOfLines: Int = 0,
                    lineBreakMode:NSLineBreakMode = .byWordWrapping,
                    translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return label
    }
    
    func makerButton(backgroundColor: UIColor = .white,
                     image: UIImage? = nil,
                     image2: UIImage? = nil,
                     title: String = "",
                     titleColor: UIColor = .init(hex: "#EF5A5A"),
                     titleFont: UIFont = Fonts.regular.size(18),
                     cornerRadius: CGFloat = 15,
                     borderWidth: CGFloat = 0,
                     borderColor: UIColor = .white,
                     translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.setImage(image, for: .normal)
        button.setImage(image2, for: .selected)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return button
    }
    
    func makerTextField(text: String = "",
                        placeholder: String = "",
                        cornerRadius: CGFloat = 12,
                        textColor: UIColor = .black,
                        backgroundColor: UIColor = .white,
                        borderColor: UIColor = .lightGray,
                        borderWidth: CGFloat = 1,
                        placeholderColor: UIColor = .init(hex: "#545151"),
                        placeholderFont: UIFont = Fonts.extraLight.size(13),
                        translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UITextField {
        let tf = UITextField()
        tf.text = text
        tf.placeholder = placeholder
        tf.layer.cornerRadius = cornerRadius
        tf.backgroundColor = backgroundColor
        tf.layer.borderColor = borderColor.cgColor
        tf.layer.borderWidth = borderWidth
        tf.textColor = textColor
        tf.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: placeholderColor,
            .font: placeholderFont
        ]
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 8))
        tf.leftView = view
        tf.leftViewMode = .always
        return tf
    }
    
}
