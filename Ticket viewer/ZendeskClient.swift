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
  var tickets: [Ticket] = []
  let apiName: String
  let apiKey: String
  let host: String
  let perPage: Int
  
  let previousPage: URL? = nil
  let nextPage: URL? = nil
  
  let path = "/api/v2/tickets.json"
  
  init(apiName: String, apiKey: String, host: String, perPage: Int) {
    self.apiName = apiName
    self.apiKey = apiKey
    self.host = host
    self.perPage = perPage
  }
  
  func url() -> URL {
    var component = URLComponents()
    component.scheme = "https"
    component.host = host
    component.path = path
    let pages = URLQueryItem(name: "per_page", value: String(perPage))
    component.queryItems = [pages]
    return component.url!
    
  }
  
  func authHeader() -> String {
    let loginData = String(format: "%@/token:%@", apiName, apiKey).data(using: String.Encoding.utf8)!
    return loginData.base64EncodedString()
  }

  func request() -> URLRequest{
    var request = URLRequest(url: url())
    request.httpMethod = "GET"
    request.setValue("Basic \(authHeader())", forHTTPHeaderField: "Authorization")
    return request
  }
  
  func fetchTickets(success: @escaping (_ tickets: [Ticket]) -> Void, failure: @escaping (String) -> Void) {

    print("start the thing")
    let dataTask = URLSession.shared.dataTask(with: self.request()) { (data, _, error) in
      do {
        let ticketResponse = try JSONDecoder().decode(TicketsResponse.self, from: data!)
        self.tickets = ticketResponse.tickets
        success(self.tickets)
      } catch {
        print ("There is an error resiving data")
        failure("Error Happened")
      }
    }
    
    // Start the download task.
    dataTask.resume()
  }
  
  
  
  
}
