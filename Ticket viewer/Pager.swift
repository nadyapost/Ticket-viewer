//
//  Pager.swift
//  Ticket viewer
//
//  Created by Nadya Postriganova on 13/6/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import Foundation

class Pager {
  let total: Int
  var page: Int
  var perPage: Int
  
  init(total: Int = 0, page: Int = 1, perPage: Int = 25) {
    self.total = total
    self.page = page
    self.perPage = perPage
  }
  
  func pages() -> Int {
      return Int(ceil(Double(total)/Double(perPage)))
  }
  
  func next() -> [URLQueryItem] {
    return [URLQueryItem(name: "herp", value: "derp")]
  }
}
