//
//  ExUITextView.swift
//  ForVK
//
//  Created by Илья Кадыров on 23.05.2021.
//  Copyright © 2021 Илья Ишунин. All rights reserved.
//

import UIKit

extension UITextView {
    
    /**
     Calculates if new textview height (based on content) is larger than a base height
     
     - parameter baseHeight: The base or minimum height
     
     - returns: The new height
     */
    func newHeight(withBaseHeight baseHeight: CGFloat) -> CGFloat {
        
        // Calculate the required size of the textview
        let fixedWidth = frame.size.width
        let newSize = sizeThatFits(CGSize(width: fixedWidth, height: .greatestFiniteMagnitude))
        var newFrame = frame
        
        // Height is always >= the base height, so calculate the possible new height
        let height: CGFloat = newSize.height > baseHeight ? newSize.height : baseHeight
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: height)
        
        return newFrame.height
    }
    
    func calculateViewHeightWithCurrentWidth() -> CGFloat {
            let textWidth = self.frame.width -
                self.textContainerInset.left -
                self.textContainerInset.right -
                self.textContainer.lineFragmentPadding * 2.0 -
                self.contentInset.left -
                self.contentInset.right
            
        let maxSize = CGSize(width: textWidth, height: CGFloat.greatestFiniteMagnitude)
        var calculatedSize = self.attributedText.boundingRect(with: maxSize,
                                                              options: [.usesLineFragmentOrigin, .usesFontLeading],
                                                                          context: nil).size
            calculatedSize.height += self.textContainerInset.top
            calculatedSize.height += self.textContainerInset.bottom
            
            return ceil(calculatedSize.height)
        }
}
