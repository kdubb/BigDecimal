//
//  TestConversion.swift
//  BigDecimalTests
//
//  Created by Leif Ibsen on 27/04/2021.
//

import XCTest
@testable import BigDecimal

class TestConversion: XCTestCase {

    override func setUpWithError() throws {
        BigDecimal.nanFlag = false
    }

    override func tearDownWithError() throws {
        XCTAssertFalse(BigDecimal.nanFlag)
    }

    func doTest1(_ x: BigDecimal) throws {
        XCTAssertEqual(x, BigDecimal(x.asString()))
    }
    
    func doTest2(_ x: BigDecimal) throws {
        XCTAssertEqual(BigDecimal(x.asString()), BigDecimal(x.asString(.plain)))
    }

    func doTest2(_ s: String) throws {
        XCTAssertEqual(s, BigDecimal(s).asString())
    }

    func test1() throws {
        try doTest1(BigDecimal.zero)
        try doTest1(BigDecimal.one)
        try doTest1(BigDecimal.ten)
        try doTest1(BigDecimal(Int.max))
        try doTest1(BigDecimal(Int.min))
        try doTest1(BigDecimal.infinity)
        try doTest1(-BigDecimal.infinity)
        try doTest2(BigDecimal(Int.max))
        try doTest2(BigDecimal(Int.min))
        try doTest2(BigDecimal(0.1))
    }

    func test2() throws {
        try doTest2("1")
        try doTest2("-1")
        try doTest2("10.001")
        try doTest2("-10.001")
        try doTest2("+Infinity")
        try doTest2("-Infinity")
    }

    func test4() throws {
        let x1 = BigDecimal(1, 308).asDouble()
        XCTAssertFalse(x1.isInfinite)
        let x2 = BigDecimal(1, 309).asDouble()
        XCTAssertTrue(x2.isInfinite)
        
        let x3 = BigDecimal(1, -323).asDouble()
        XCTAssertFalse(x3.isZero)
        let x4 = BigDecimal(1, -324).asDouble()
        XCTAssertTrue(x4.isZero)
    }

}
