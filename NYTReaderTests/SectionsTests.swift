//
//  SectionsTests.swift
//  NYTReaderTests
//
//  Created by tambanco 🥳 on 23.05.2021.
//  Copyright © 2021 Tambanco. All rights reserved.
//

import XCTest
@testable import NYTReader

class SectionsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testbasicURLNotEmpty() {
        let sections = Sections()
        
        XCTAssertNotEqual(sections.allSections, "")
    }
    

}
