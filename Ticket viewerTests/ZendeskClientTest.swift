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
  
  func testDownloadNext25() {
    let client = ZendestClient(
      apiName: "nadyapostr@gmail.com",
      apiKey: "Ne4dvhBqAleizOpjSGkkYqSiuHbUz4hTRQAyEscj",
      host: "nadyapost.zendesk.com",
      perPage: 25
    )
    
    let expectation = XCTestExpectation(description: "Download zendesk tickets")
    
    let success = {(_ tickets: [Ticket]) in
      XCTAssertNotNil(Data(), "No data was downloaded.")
      XCTAssertEqual(tickets.count, 25)
      XCTAssertEqual(client.nextPage, URL(string: "https://nadyapost.zendesk.com/api/v2/tickets.json?page=2&per_page=25"))
      XCTAssertEqual(client.nextPage, URL(string: "https://nadyapost.zendesk.com/api/v2/tickets.json?page=2&per_page=25"))
      expectation.fulfill()
    }
    let failure = { (err) in print(err)}
    
    client.next()
    client.next(success: success, failure: failure)
    
    wait(for: [expectation], timeout: 10.0)
  }
  
  func testDownloadPrev25() {
    let client = ZendestClient(
      apiName: "nadyapostr@gmail.com",
      apiKey: "Ne4dvhBqAleizOpjSGkkYqSiuHbUz4hTRQAyEscj",
      host: "nadyapost.zendesk.com",
      perPage: 25
    )
    let expectation = XCTestExpectation(description: "Download zendesk tickets")
    
    let success = {(_ tickets: [Ticket]) in
      XCTAssertNotNil(Data(), "No data was downloaded.")
      XCTAssertEqual(client.nextPage, URL(string: "https://nadyapost.zendesk.com/api/v2/tickets.json?page=1&per_page=25"))
      XCTAssertEqual(client.previousPage, URL(string: "https://nadyapost.zendesk.com/api/v2/tickets.json?page=2&per_page=25"))
      expectation.fulfill()
    }
    let failure = { (err) in print(err)}

    client.next()
    client.next()
    client.previous(success: success, failure: failure)
    
    wait(for: [expectation], timeout: 10.0)
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
