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
  let url: URL
  
  
  init(apiName: String, apiKey: String, url: URL) {
    self.apiName = apiName
    self.apiKey = apiKey
    self.url = url
  }
  
  func authHeader() -> String {
    let loginData = String(format: "%@/token:%@", apiName, apiKey).data(using: String.Encoding.utf8)!
    return loginData.base64EncodedString()
  }

  func request() -> URLRequest{
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("Basic \(authHeader())", forHTTPHeaderField: "Authorization")
    return request
  }
  
  func fetchTickets(success: @escaping () -> Void, failure: @escaping (String) -> Void) {

    print("start the thing")
    let dataTask = URLSession.shared.dataTask(with: self.request()) { (data, _, error) in
      do {
        let ticketResponse = try JSONDecoder().decode(TicketsResponse.self, from: data!)
        self.tickets = ticketResponse.tickets
        success()
      } catch {
        print ("There is an error resiving data")
        failure("Error Happened")
      }
    }
    
    // Start the download task.
    dataTask.resume()
  }
  
  
  
  
}
