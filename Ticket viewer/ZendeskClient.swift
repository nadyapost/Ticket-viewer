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
  
  
  var page: String?
  var previousPage: URL? = nil
  var nextPage: URL? = nil
  
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
    component.queryItems = [URLQueryItem(name: "per_page", value: String(perPage))]
    return component.url!
  }
  
  func authHeader() -> String {
    let loginData = String(format: "%@/token:%@", apiName, apiKey).data(using: String.Encoding.utf8)!
    return loginData.base64EncodedString()
  }
  
  func request(url: URL) -> URLRequest{
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    request.setValue("Basic \(authHeader())", forHTTPHeaderField: "Authorization")
    return request
  }
  
  func fetchTickets(success: @escaping (_ tickets: [Ticket]) -> Void = {_ in}, failure: @escaping (String) -> Void = {_ in}, url: URL)  {
    print("start the thing")
    
    let dataTask = URLSession.shared.dataTask(with: self.request(url: url)) { (data, _, error) in
      do {
        let ticketResponse = try JSONDecoder().decode(TicketsResponse.self, from: data!)
        print(ticketResponse)
        self.tickets = ticketResponse.tickets
        self.previousPage = URL(string: ticketResponse.previous_page ?? "")
        self.nextPage = URL(string: ticketResponse.next_page ?? "")
        self.page = ticketResponse.page
        success(self.tickets)
      } catch {
        print ("There is an error resiving data", error)
        failure("Error Happened")
        
      }
    }
    
    // Start the download task.
    dataTask.resume()
  }
  
  func next(success: @escaping (_ tickets: [Ticket]) -> Void = {_ in}, failure: @escaping (String) -> Void = {_ in}) {
    print(self)
    var nextUrl = url()
    if self.nextPage != nil {
      nextUrl = self.nextPage!
    }
    self.fetchTickets(success: success, failure: failure, url: nextUrl)
  }
  
  func previous(success: @escaping (_ tickets: [Ticket]) -> Void = {_ in}, failure: @escaping (String) -> Void = {_ in}) {
    if previousPage != nil {
      self.fetchTickets(success: success, failure: failure, url: previousPage!)
    }
  }
}
