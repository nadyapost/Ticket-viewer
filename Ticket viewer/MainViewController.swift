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
  let client = ZendestClient(apiName: "nadyapostr@gmail.com", apiKey: "Ne4dvhBqAleizOpjSGkkYqSiuHbUz4hTRQAyEscj", url: URL(string: "https://nadyapost.zendesk.com/api/v2/tickets.json")!)
  var ticketsList: [Ticket] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Started view")
    let success = { (_ tickets: [Ticket]) in
      DispatchQueue.main.async {
        self.ticketsList = tickets
        self.tableView.reloadData()
        print("tickets are ready \(self.client.tickets)")
      }
    }
    
    let failure = {(error) in print(error)}
    
    
    client.fetchTickets(success: success, failure: failure)
    
    print("assigned tickets \(client.tickets)")
    
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("count called")
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





