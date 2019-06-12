//
//  ZendeskClient.swift
//  Ticket viewer
//
//  Created by Nadya Postriganova on 12/6/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import Foundation

class ZendestClient {
  //Fetch tickets from API
  //Decode JSON
  //Paginate
  
  let apiName: String
  let apiKey: String
  let url: String
  
  init(apiName: String, apiKey: String, url: String) {
    self.apiName = apiName
    self.apiKey = apiKey
    self.url = url
  }
  
  func fetchTickets() -> Sting {
    
  }
  
  
  
  
}
