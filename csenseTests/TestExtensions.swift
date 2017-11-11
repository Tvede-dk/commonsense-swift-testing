//
//  TestExtensions.swift
//  csenseTests
//
//  Created by Kasper T on 03/11/2017.
//  Copyright © 2017 commonsense. All rights reserved.
//

import Foundation
import XCTest

public extension Equatable {
    public func assert(_ otherValue: Self, message: String = "",
                       file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(self, otherValue, message, file: file, line: line)
    }

    public func assert(_ otherValue: Self?, message: String = "",
                       file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(self, otherValue, message, file: file, line: line)
    }
}

public extension Optional {
    public func assertNil(message: String = "",
                          file: StaticString = #file,
                          line: UInt = #line) {
        XCTAssertNil(self, message, file: file, line: line)
    }

    public func assertNotNil(message: String = "",
                             file: StaticString = #file,
                             line: UInt = #line) {
        XCTAssertNotNil(self, message, file: file, line: line)
    }

    public func assertNotNilAnd(message: String = "",
                                file: StaticString = #file,
                                line: UInt = #line,
                                otherAction: (Wrapped) -> Void) {
        guard let safe = self else {
            XCTAssertNotNil(self, file: file, line: line)
            return
        }
        otherAction(safe)
    }

}

public extension Optional where Wrapped: Equatable {
    public func assertNotNilEquals(_ value: Wrapped, message: String = "",
                                   file: StaticString = #file, line: UInt = #line) {
        guard let safe = self else {
            XCTAssertNotNil(self, file: file, line: line)
            return
        }
        XCTAssertEqual(safe, value, message)
    }

    public func assert(_ otherValue: Wrapped?, message: String = "",
                       file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(self, otherValue, message, file: file, line: line)
    }
}

public extension XCTestCase {
    func failTests(_ message: String, file: StaticString = #file, line: UInt = #line) {
        XCTFail(message, file: file, line: line)
    }
}
