//
//  ViewController.swift
//  FittableLabel
//
//  Created by Tom Baranes on 20/01/16.
//  Copyright © 2016 Recisio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties IB
    
    @IBOutlet weak var autoFittableLabel: FittableFontLabel! {
        didSet {
            autoFittableLabel.layer.borderWidth = 2.0
            autoFittableLabel.layer.borderColor = UIColor.redColor().CGColor
            autoFittableLabel.layer.cornerRadius = 3.0
        }
    }
    
    @IBOutlet weak var labelFittableWidthAndHeight: UILabel! {
        didSet {
            labelFittableWidthAndHeight.text = words[0]
            labelFittableWidthAndHeight.layer.borderWidth = 2.0
            labelFittableWidthAndHeight.layer.borderColor = UIColor.redColor().CGColor
            labelFittableWidthAndHeight.layer.cornerRadius = 3.0
        }
    }
    
    @IBOutlet weak var labelFittableWidth: UILabel!  {
        didSet {
            labelFittableWidth.layer.borderWidth = 2.0
            labelFittableWidth.layer.borderColor = UIColor.redColor().CGColor
            labelFittableWidth.layer.cornerRadius = 3.0
            labelFittableWidth.text = words[0..<3].joinWithSeparator(" ")
        }
    }
    
    @IBOutlet weak var attributedLabelFittable: UILabel!  {
        didSet {
            attributedLabelFittable.text = words[0]
            attributedLabelFittable.layer.borderWidth = 2.0
            attributedLabelFittable.layer.borderColor = UIColor.redColor().CGColor
            attributedLabelFittable.layer.cornerRadius = 3.0
        }
    }

    // MARK: Properties 
    
    let words = [String](["apple", "orange", "banana", "grape", "kiwi", "mango", "lychee", "lemon", "coconut", "pear", "pineapple", "peach", "strawberry", "fig", "lime", "papaya", "nectarine", "plum", "quince", "raspberry", "ohajiki", "watermelon", "blackberry", "cherry", "avocado"])
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: #selector(reloadLabels), userInfo: nil, repeats: true);
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        
        
        self.view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
    }
    
    func reloadLabels() {
        let random = Int(arc4random()) % self.words.count
        labelFittableWidthAndHeight.text = String(format: "%@ %@", labelFittableWidthAndHeight.text!, words[random])
        labelFittableWidthAndHeight.fontSizeToFit(maxFontSize: 50)
        autoFittableLabel.text = labelFittableWidthAndHeight.text
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 10.0
        paragraph.alignment = .Center
        let attributes = [NSParagraphStyleAttributeName: paragraph]
        let attributedText = NSAttributedString(string: labelFittableWidthAndHeight.text!, attributes: attributes)
        attributedLabelFittable.attributedText = attributedText
        attributedLabelFittable.fontSizeToFit(maxFontSize: 50)
        
        let screenWidth = labelFittableWidth.window!.screen.bounds.width
        let newWidth = CGFloat(arc4random()) % (screenWidth - 50.0)
        labelFittableWidth.frame.size.width = newWidth
        labelFittableWidth.fontSizeToFit(maxFontSize: 50)
    }

}
