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
  let client = ZendestClient(apiName: "nadyapostr@gmail.com", apiKey: "Ne4dvhBqAleizOpjSGkkYqSiuHbUz4hTRQAyEscj", host: "nadyapost.zendesk.com", perPage: 25)
  var ticketsList: [Ticket] = []
  
  
  func success (_ tickets: [Ticket]) {
    DispatchQueue.main.async {
      self.navigationItem.leftBarButtonItem?.isEnabled = (self.client.previousPage != nil)
      self.navigationItem.rightBarButtonItem?.isEnabled = (self.client.nextPage != nil)
      self.ticketsList = tickets
      self.tableView.reloadData()
    }
  }
  
  func failure(error: String) {
    print(error)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Started view")

    
    client.next(success: success, failure: failure)
  
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Previous", style: .plain, target: self, action: #selector(previousPageTapped))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextPageTapped))
    navigationItem.leftBarButtonItem?.isEnabled = false
    
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
  
  
  @objc func previousPageTapped() {
    if client.previousPage != nil {
      client.previous(success: success, failure: failure)
    }
    
  }
  
  @objc func nextPageTapped() {
    client.next(success: success, failure: failure)
  }
}





