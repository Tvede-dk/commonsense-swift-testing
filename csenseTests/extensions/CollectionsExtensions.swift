//
// Created by Kasper T on 09/12/2017.
// Copyright (c) 2017 commonsense. All rights reserved.
//

import Foundation

/**
 *
 */
public extension Optional where Wrapped: Collection, Wrapped.IndexDistance == Int {

    /**
     *
     */
    public func assertCount(_ size: Int, message: String = "",
                            file: StaticString = #file, line: UInt = #line) {
        self.assertNotNil()
        self?.count.assert(size, message: message, file: file, line: line)
    }
}

public extension Collection where IndexDistance == Int {

    /**
     *
     */
    public func assertCount(_ size: Int, message: String = "",
                            file: StaticString = #file, line: UInt = #line) {
        size.assert(count, message: message, file: file, line: line)
    }
}
