//
//  ZendeskClientTest.swift
//  Ticket viewerTests
//
//  Created by Nadya Postriganova on 12/6/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import XCTest
@testable import Ticket_viewer

class ZendeskClientTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchTickets() {
      let client = ZendestClient(apiName: "nadyapost", apiKey: "Ne4dvhBqAleizOpjSGkkYqSiuHbUz4hTRQAyEscj", url: " https://nadyapost.zendesk.com")
      
      print(client.fetchTickets())
      
      
      
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
