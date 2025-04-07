//
//  TestInitInt.swift
//  
//
//  Created by Leif Ibsen on 04/10/2022.
//

import Testing
@testable import BigDecimal
import BigInt

@Suite("Test init<I:BinaryInteger>(_:)", .serialized)
final class TestIntInit  {

    static func genInts<I: FixedWidthInteger>(_ type: I.Type) -> [I] {
        return [
            .max,
            .max - 1,
            .max / 2,
            .max / 4,
            .max / 8,
            1,
            0,
            -1,
            I.max / -8,
            .max / -4,
            .max / -2,
            .min + 1,
            .min,
        ]
    }

    @Test("Test Int", arguments: genInts(Int.self)) func testInts(t: Int) {
        #expect(BigDecimal(t).description == t.description)
    }

    @Test("Test Int8", arguments: genInts(Int8.self)) func testInt8s(t: Int8) {
        #expect(BigDecimal(t).description == t.description)
    }

    @Test("Test Int16", arguments: genInts(Int16.self)) func testInt16s(t: Int16) {
        #expect(BigDecimal(t).description == t.description)
    }

    @Test("Test Int32", arguments: genInts(Int32.self)) func testInt32s(t: Int32) {
        #expect(BigDecimal(t).description == t.description)
    }

    @Test("Test Int64", arguments: genInts(Int64.self)) func testInt64s(t: Int64) {
        #expect(BigDecimal(t).description == t.description)
    }

    @available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 1, macCatalyst 18, *)
    @Test("Test Int128", arguments: genInts(Int128.self)) func testInt128s(t: Int128) {
        #expect(BigDecimal(t).description == t.description)
    }
}
