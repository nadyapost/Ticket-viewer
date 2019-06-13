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
  
  func testDownloadFirst25() {
    let client = ZendestClient(
        apiName: "nadyapostr@gmail.com",
        apiKey: "Ne4dvhBqAleizOpjSGkkYqSiuHbUz4hTRQAyEscj",
        url: URL(string: "https://nadyapost.zendesk.com/api/v2/tickets.json")!
    )
    
    let expectation = XCTestExpectation(description: "Download zendesk tickets")
    let success = {(_ _: [Ticket]) in
      XCTAssertNotNil(Data(), "No data was downloaded.")
      expectation.fulfill()
    }
    let failure = { (err) in print(err)}

    client.fetchTickets(success: success, failure: failure)
    
    wait(for: [expectation], timeout: 10.0)
  }
  
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
