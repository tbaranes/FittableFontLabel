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

    // MARK: Helper

    let shortText = "Etiam turpis elit"
    // swiftlint:disable:next line_length
    let longText = "Etiam turpis elit, efficitur nec suscipit vitae, aliquam vitae lorem. Aenean mauris tortor, semper vel facilisis nec, facilisis ut neque. Aliquam erat volutpat. Nam eget varius mauris, ut condimentum quam. Duis ex nisi, iaculis in ex ut, lobortis pretium est. Sed non lorem venenatis, fermentum quam aliquet, ultrices arcu. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis ullamcorper convallis tellus, vitae bibendum mi dapibus in. Morbi pellentesque aliquet urna, id aliquet orci efficitur sed. Donec et mi urna. Proin sagittis semper massa in semper."
}

// MARK: - Single line

extension FittableFontLabelTests {

    // MARK: Expecting size

    func testSingleLine_expectingMinSize() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = longText
        let fontSize = label.fontSizeThatFits(text: longText, maxFontSize: 20, minFontScale: 0.1,
                                              rectSize: CGSize(width: 20, height: 20))
        XCTAssertEqual(fontSize, 20 * 0.1)
    }

    func testSingleLine_expectingMaxSize() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = longText
        let fontSize = label.fontSizeThatFits(text: shortText, maxFontSize: 20, minFontScale: 0.1,
                                              rectSize: CGSize(width: 1000, height: 1000))
        XCTAssertEqual(fontSize, 20)
    }

    func testSingleLine_expectingMediumSize() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = longText
        let fontSize = label.fontSizeThatFits(text: shortText, maxFontSize: 100, minFontScale: 0.1,
                                              rectSize: CGSize(width: 100, height: 100))
        XCTAssertTrue(fontSize > 100 * 0.1)
        XCTAssertTrue(fontSize < 100)
    }

    // MARK: Special case

    func testSingleLine_withEmptyTextLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let fontSize = label.fontSizeThatFits(text: shortText, maxFontSize: 20, minFontScale: 0.1,
                                              rectSize: CGSize(width: 1000, height: 1000))
        XCTAssertEqual(fontSize, 20)
    }

    func testSingleLine_withSizeZero() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let fontSize = label.fontSizeThatFits(text: shortText, maxFontSize: 20, minFontScale: 0.1,
                                              rectSize: CGSize(width: 0, height: 0))
        XCTAssertEqual(fontSize, 20 * 0.1)
    }

}

// MARK: - Multiline line

extension FittableFontLabelTests {

    // MARK: Expecting size

    func testMultiline_expectingMinSize() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.numberOfLines = 0
        label.text = longText
        let fontSize = label.fontSizeThatFits(text: longText, maxFontSize: 20, minFontScale: 0.1,
                                              rectSize: CGSize(width: 0, height: 0))
        XCTAssertEqual(fontSize, 20 * 0.1)
    }

    func testMultiline_expectingMaxSize() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.numberOfLines = 0
        label.text = longText
        let fontSize = label.fontSizeThatFits(text: shortText, maxFontSize: 20, minFontScale: 0.1,
                                              rectSize: CGSize(width: 1000, height: 1000))
        XCTAssertEqual(fontSize, 20)
    }

    func testMultiline_expectingMediumSize() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.numberOfLines = 0
        label.text = longText
        let fontSize = label.fontSizeThatFits(text: shortText, maxFontSize: 100, minFontScale: 0.1,
                                              rectSize: CGSize(width: 100, height: 100))
        XCTAssertTrue(fontSize > 100 * 0.1)
        XCTAssertTrue(fontSize < 100)
    }

    // MARK: Special case

    func testMultiline_withEmptyTextLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.numberOfLines = 0
        let fontSize = label.fontSizeThatFits(text: shortText, maxFontSize: 20, minFontScale: 0.1,
                                              rectSize: CGSize(width: 1000, height: 1000))
        XCTAssertEqual(fontSize, 20)
    }

    func testMultiline_withSizeZero() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.numberOfLines = 0
        let fontSize = label.fontSizeThatFits(text: shortText, maxFontSize: 20, minFontScale: 0.1,
                                              rectSize: CGSize(width: 0, height: 0))
        XCTAssertEqual(fontSize, 20 * 0.1)
    }

}
