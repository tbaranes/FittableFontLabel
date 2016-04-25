// FittableLabel.swift
//
// Copyright (c) 2016 Tom Baranes (https://github.com/tbaranes)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

public extension UILabel {
    
    /**
     Resize the font to make the current text fit the label frame.
     
     - parameter maxFontSize:  The max font size available
     - parameter minFontScale: The min font scale that the font will have
     - parameter rectSize:     Rect size where the label must fit
     */
    public func fontSizeToFit(maxFontSize maxFontSize: CGFloat = CGFloat.NaN, minFontScale: CGFloat = 0.1,rectSize: CGSize? = nil) {
        let maxFontSize = maxFontSize.isNaN ? 100 : maxFontSize
        let minFontScale = minFontScale.isNaN ? 0.1 : minFontScale
        let rectSize = rectSize ?? bounds.size
        fontSizeToFit(maxFontSize: maxFontSize, minimumFontScale: minFontScale, rectSize: rectSize)
    }
    
}

private extension UILabel {
    
    func fontSizeToFit(maxFontSize maxFontSize: CGFloat, minimumFontScale: CGFloat, rectSize: CGSize) {
        var newAttributes = currentAttributedStringAttributes()
        guard let text = self.text where text.characters.count != 0 && newAttributes.count > 0 else {
            return
        }
        
        let minimumFontSize = maxFontSize * minimumFontScale
        let boundingSize = numberOfLines == 1 ? CGSize(width: CGFloat.max, height: rectSize.height) : CGSize(width: rectSize.width, height: CGFloat.max)
        var newFont = UIFont()
        var fontSize = maxFontSize
        repeat {
            newFont = font.fontWithSize(fontSize)
            newAttributes[NSFontAttributeName] = newFont
            let area = text.boundingRectWithSize(boundingSize, options: .UsesLineFragmentOrigin, attributes: newAttributes, context: nil).size
            if (numberOfLines == 1 && area.width <= rectSize.width) ||
                (numberOfLines != 1 && area.height <= rectSize.height) {
                break
            }
            
            fontSize -= 1
            if fontSize < minimumFontSize {
                fontSize = minimumFontSize
            }
        } while fontSize > minimumFontSize
        font = newFont
    }
    
    func currentAttributedStringAttributes() -> [String : AnyObject] {
        var newAttributes = [String: AnyObject]()
        attributedText?.enumerateAttributesInRange(NSRange(0..<(text?.characters.count ?? 0)), options: .LongestEffectiveRangeNotRequired, usingBlock: { attributes, range, stop in
            newAttributes = attributes
        })
        return newAttributes
    }

}