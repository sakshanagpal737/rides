//
//  InputTextValidationsTests.swift
//  RidesTests
//
//  Created by Saksha Nagpal on 2024-10-01.
//

import XCTest
@testable import Rides

final class InputTextValidationsTests: XCTestCase {

    private var sut: VehicleViewModel!

    override func setUp() {
        super.setUp()
        sut = VehicleViewModel(inputText: "")
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_inRangeInputText()
    {
        // if in range then return true
        
        // Arrange
        let inputText = "10"
        
        // Act
        let result = sut.inputTextValidator.validateInputStringIsInRange(size: inputText)
        
        // Assert
        XCTAssertTrue(result)
        
    }
    
    func test_outOfRangeInputText()
    {
        // if out of range then return false
        
        // Arrange
        let inputText = "200"
        
        // Act
        let result = sut.inputTextValidator.validateInputStringIsInRange(size: inputText)
        
        // Assert
        XCTAssertFalse(result)
    }
    
    func test_emptyInputText()
    {
        // return false
        
        // Arrange
        let inputText = ""
        
        // Act
        let result = sut.inputTextValidator.validateInputStringIsInRange(size: inputText)
        
        // Assert
        XCTAssertFalse(result)
    }
    
    func test_borderRangeInputText()
    {
        // if in range then return true
        
        // Arrange
        let inputText = "100"
        
        // Act
        let result = sut.inputTextValidator.validateInputStringIsInRange(size: inputText)
        
        // Assert
        XCTAssertTrue(result)
        
    }

}
