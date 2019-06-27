//
//  Ticket.swift
//  Ticket viewer
//
//  Created by Nadya Postriganova on 12/6/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import Foundation

struct Ticket: Codable {
  var subject: String
  var description: String
}

struct TicketsResponse: Codable {
  let tickets: [Ticket]
  let page: String?
  let next_page: String?
  let previous_page: String?
}
