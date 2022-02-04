//
//  KernButton.swift
//  Copyright © 2017 Ymedialabs. All rights reserved.
//

import UIKit

class KernButton: UIButton {
    
    @IBInspectable var letterSpacing : CGFloat = 0.8
    
    override func setTitle(_ title: String?, for state: UIControlState) {
        super.setTitle(title, for: .normal)
        
        setAttributedTitle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        assert(buttonType == .custom, "Please set the button type to custom")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        assert(buttonType == .custom, "Please set the button type to custom")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        assert(buttonType == .custom, "Please set the button type to custom")
        
        setAttributedTitle()
    }
    
    /// Sets the attributed title for selected and highlighted state
    func setAttributedTitle(color: UIColor? = nil) {
        // This is to avoud flickering when setting the text
        UIView.performWithoutAnimation {
            var attributes = [String : AnyObject]()
            var attributedString = NSMutableAttributedString()
            
            if let font = titleLabel?.font {
                attributes[NSFontAttributeName] = font
            }
            
            var textColorSelected = currentTitleColor
            
            if let newColor = color {
                textColorSelected = newColor
            }
            
            attributes[NSForegroundColorAttributeName] = textColorSelected
            attributedString = NSMutableAttributedString(string: (title(for: .normal) ?? "")!, attributes: attributes)
            
            if attributedString.length != 0 {
                attributedString.addAttribute(NSKernAttributeName, value: letterSpacing, range: NSMakeRange(0, attributedString.length - 1))
            }
            
            setAttributedTitle(attributedString , for: .normal)
            
            attributes[NSForegroundColorAttributeName] = textColorSelected.withAlphaComponent(0.1)
            attributedString = NSMutableAttributedString(string: (title(for: .normal) ?? "")!, attributes: attributes)
            
            if attributedString.length != 0 {
                attributedString.addAttribute(NSKernAttributeName, value: letterSpacing, range: NSMakeRange(0, attributedString.length - 1))
            }
            
            setAttributedTitle(attributedString, for: [.highlighted])
            layoutIfNeeded()
        }
    }
}
