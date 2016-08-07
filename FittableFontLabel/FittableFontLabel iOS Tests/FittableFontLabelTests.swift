//
//  FittableFontLabelTests.swift
//  FittableFontLabelTests
//
//  Created by Tom Baranes on 25/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import FittableFontLabel

class FittableFontLabelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

extension FittableFontLabelTests {
    
    func testMinFontScale() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        label.text = "Etiam turpis elit, efficitur nec suscipit vitae, aliquam vitae lorem. Aenean mauris tortor, semper vel facilisis nec, facilisis ut neque. Aliquam erat volutpat. Nam eget varius mauris, ut condimentum quam. Duis ex nisi, iaculis in ex ut, lobortis pretium est. Sed non lorem venenatis, fermentum quam aliquet, ultrices arcu. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis ullamcorper convallis tellus, vitae bibendum mi dapibus in. Morbi pellentesque aliquet urna, id aliquet orci efficitur sed. Donec et mi urna. Proin sagittis semper massa in semper."
        label.fontSizeToFit(maxFontSize: 20, minFontScale: 1)
        XCTAssertEqual(label.font.pointSize, 20)
    }

    func testMaxFontSize() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        label.text = "Etiam"
        label.fontSizeToFit(maxFontSize: 20, minFontScale: 0.1)
        XCTAssertEqual(label.font.pointSize, 20)
    }

    func testMaxFontSizeThatFit() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        label.text = "Etiam"
        XCTAssertEqual(20, label.fontSizeThatFits(text: "Etiam", maxFontSize: 20))

        label.text = ""
        XCTAssertEqual(20, label.fontSizeThatFits(text: "Etiam", maxFontSize: 20))
    }

}
