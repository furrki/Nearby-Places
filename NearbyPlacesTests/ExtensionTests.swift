//
//  ExtensionTests.swift
//  NearbyPlacesTests
//
//  Created by Furkan Kaynar on 27.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import XCTest
@testable import NearbyPlaces

class ExtensionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDateGetDayOfWeek() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        let someWednesday: Int = formatter.date(from: "2020/02/26")!.getDayOfWeek()
        XCTAssertEqual(someWednesday, 2)
        
        let someTuesday: Int = formatter.date(from: "2020/02/25")!.getDayOfWeek()
        XCTAssertEqual(someTuesday, 1)
        
        let someMonday: Int = formatter.date(from: "2020/02/24")!.getDayOfWeek()
        XCTAssertEqual(someMonday, 0)
        
        let someSunday: Int = formatter.date(from: "2020/02/23")!.getDayOfWeek()
        XCTAssertEqual(someSunday, 6)
    }
    
    func testPhoneNumberToUrl() {
        var phoneNumber: String = "+359 12 12 122 -"
        XCTAssertEqual(phoneNumber.phoneNumberToUrl(), URL(string: "tel://+3591212122"))
        
        phoneNumber = "+90 534 534 524"
        XCTAssertEqual(phoneNumber.phoneNumberToUrl(), URL(string: "tel://+90534534524"))
        
        phoneNumber = "90 534 534 524"
        XCTAssertEqual(phoneNumber.phoneNumberToUrl(), URL(string: "tel://90534534524"))
    }
}
