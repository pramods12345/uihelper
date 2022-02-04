//
//  KernLabel.swift
//  Copyright © 2017 Ymedialabs. All rights reserved.
//

import UIKit

class KernLabel: UILabel {
    
    @IBInspectable var letterSpacing : CGFloat = 1.0
    
    override var text: String? {
        didSet {
            setAttributedTitle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setAttributedTitle()
    }
    
    fileprivate func setAttributedTitle(_ title : String? = nil, forColor color : UIColor? = nil) {
        var attributes = [String : AnyObject]()
        var attributedString = NSAttributedString()
        
        attributes[NSFontAttributeName] = font
        
        if let color = color {
            attributes[NSForegroundColorAttributeName] = color
            textColor = color
        }
        else {
            attributes[NSForegroundColorAttributeName] = textColor
        }
        
        attributes[NSKernAttributeName] = letterSpacing as AnyObject?
        
        if let title = title {
            attributedString = NSAttributedString(string: title, attributes: attributes)
        }
        else {
            attributedString = NSAttributedString(string: (text ?? "")!, attributes: attributes)
        }
        
        attributedText = attributedString
    }
}
