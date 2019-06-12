//
//  ViewController.swift
//  Ticket viewer
//
//  Created by Nadya Postriganova on 11/6/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import UIKit

class mainViewController: UITableViewController {
  
  var segueIdentifier = "mainToDetail"
  
  var ticketsList: [Ticket] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ticketsList = Ticket.createTicketsArray()
    

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

  

  

