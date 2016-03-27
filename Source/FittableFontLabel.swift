//
//  FittableFontLabel.swift
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

// An UILabel subclass allowing you to automatize the process of adjusting the font size.
@IBDesignable public class FittableFontLabel: UILabel {
    
    // MARK: Properties
    
    // If true, the font size will be adjusted each time that the text or the frame change.
    @IBInspectable public var autoAdjustFontSize: Bool = true
    
    // The biggest font size to use during drawing. The default value is the current font size
    @IBInspectable public var maxFontSize = CGFloat.NaN
    
    // The scale factor that determines the smallest font size to use during drawing. The default value is 0.1
    @IBInspectable public var minFontScale = CGFloat.NaN
    
    public override var text: String? {
        didSet {
            adjustFontSize()
        }
    }
    
    public override var frame: CGRect {
        didSet {
            adjustFontSize()
        }
    }
    
    // MARK: Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    // MARK: 
    
    private func adjustFontSize() {
        if autoAdjustFontSize {
            fontSizeToFit(maxFontSize: maxFontSize, minFontScale: minFontScale)
        }
    }
}
