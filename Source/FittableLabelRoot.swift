//
//  FittableLabelRoot.swift
//  
//
//  Created by Tyson_Freeze on 12/31/21.
//

import UIKit

/// A UIView subclass to give the FittableFontLabel package a root to recursively search for UILabels within.
open class FittableLabelRoot: UIView {
    
    /// If true, this view and it's subviews will be searched for any UILabels with a fontSizeLinkIdentifier.
    @IBInspectable public var searchView: Bool = true

    // MARK: Private
    
    private var fontSizeLinks: [String : fontSizeLink] = [:]
    
    private class fontSizeLink {
        var minimumFontSize: CGFloat = CGFloat.greatestFiniteMagnitude
        var labels: [FittableFontLabel] = []
        
        init(label: FittableFontLabel) {
            add(label: label)
        }
        
        func add(label: FittableFontLabel) {
            labels.append(label)
            if label.autoAdjustFontSize {
                minimumFontSize = min(minimumFontSize, label.font.pointSize)
            }
        }
    }

    // MARK: Life cycle

    open override func draw(_ rect: CGRect) {
        updateFontSizeLinks(in: self)
        standardizeFontSizes()
    }
    
    // MARK: Search
    
    private func updateFontSizeLinks(in view: UIView) {
        for subview in view.subviews {
            print(subview.self)
            if let label = subview as? FittableFontLabel {
                if let fontSizeLinkIdentifier = label.fontSizeLinkIdentifier {
                    if let fontSizeLink = fontSizeLinks[fontSizeLinkIdentifier] {
                        fontSizeLink.add(label: label)
                    } else {
                        fontSizeLinks[fontSizeLinkIdentifier] = fontSizeLink(label: label)
                    }
                }
            } else {
                updateFontSizeLinks(in: subview)
            }
        }
    }
    
    private func standardizeFontSizes() {
        for fontLink in fontSizeLinks.values {
            for label in fontLink.labels {
                label.font = label.font.withSize(fontLink.minimumFontSize)
            }
        }
    }
}
