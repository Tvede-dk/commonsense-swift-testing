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
    public func assert(_ otherValue : Self , message : String = "")  {
        XCTAssertEqual(self, otherValue, message)
    }
}

public extension Optional {
    public func assertNil(message : String = ""){
        XCTAssertNil(self,message)
    }
    public func assertNotNil(message : String = ""){
        XCTAssertNotNil(self, message)
    }
    
    public func assertNotNilAnd(message : String = "", otherAction : (Wrapped)->Void) {
        guard let safe = self else{
            XCTAssertNotNil(self)
            return
        }
        otherAction(safe)
    }
    
   
}

public extension Optional where Wrapped : Equatable {
    public func assertNotNilEquals(_ value : Wrapped , message : String = "") {
        guard let safe = self else{
            XCTAssertNotNil(self)
            return
        }
        XCTAssertEqual(safe, value,message)
    }
}
