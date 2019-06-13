//
//  Ticket.swift
//  Ticket viewer
//
//  Created by Nadya Postriganova on 12/6/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import Foundation

class Ticket: Codable {
  var subject: String
  var description: String
  
  init(subject: String, description: String) {
    self.subject = subject
    self.description = description
  }
}

struct TicketsResponse: Codable {
  let tickets: [Ticket]
  init(tickets: [Ticket]) {
    self.tickets = tickets
  }
}
