//
//  ViewController.swift
//  Ticket viewer
//
//  Created by Nadya Postriganova on 11/6/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
  
  var segueIdentifier = "mainToDetail"
  
  var ticketsList: [Ticket] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ticketsList = Ticket.createTicketsArray()
//    let url = "https://gist.githubusercontent.com/svizzari/c7ffed8e10d3a456b40ac9d18f34289c/raw/325e600e7c8aac3643fc75cb7a4228dfa99eb02e/tickets.json"
//    let urlOblect = URL(string: url)
//
//    URLSession.shared.dataTask(with: urlOblect!) {
//      (data, response, error) in
//      do {
//        let tickets = try JSONDecoder().decode([Ticket].self, from: data!)
//
//        for ticket in tickets {
//          self.tickets.append(ticket)
//        }
//
//      } catch {
//        print ("There is an error resiving data")
//      }
//
//    }.resume()
    
    
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return ticketsList.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let ticket = ticketsList[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = ticket.subject
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let ticket = ticketsList[indexPath.row]
    performSegue(withIdentifier: segueIdentifier, sender: ticket)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == segueIdentifier {
      let destinationViewController = segue.destination as! DetailViewController
      destinationViewController.ticket = sender as? Ticket
    }
  }
  
}





