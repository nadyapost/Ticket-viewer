//
//  DetailViewController.swift
//  Ticket viewer
//
//  Created by Nadya Postriganova on 11/6/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet var subjectLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  
  var ticket: Ticket?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
  }
  
  func setUI() {
    subjectLabel.text = ticket?.subject
    descriptionLabel.text = ticket?.description
    
  }


}
