//
//  Ticket.swift
//  Ticket viewer
//
//  Created by Nadya Postriganova on 12/6/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import Foundation

class Ticket: Codable {
  var subject: String
  var description: String
  
  init(subject: String, description: String) {
    self.subject = subject
    self.description = description
  }
  
  class func createTicketsArray() -> [Ticket] {
    var tickets: [Ticket] = []
    
    let t1 = Ticket(subject: "Hello", description: "Test ticket descripton.")
    let t2 = Ticket(subject: "Testy test", description: "Aute ex sunt culpa ex ea esse sint cupidatat aliqua ex consequat sit reprehenderit. Velit labore proident quis culpa ad duis adipisicing laboris voluptate velit incididunt minim consequat nulla. Laboris adipisicing reprehenderit minim tempor officia ullamco occaecat ut laborum.\n\nAliquip velit adipisicing exercitation irure aliqua qui. Commodo eu laborum cillum nostrud eu. Mollit duis qui non ea deserunt est est et officia ut excepteur Lorem pariatur deserunt.")
     let t3 = Ticket(subject: "Some wierd Franch task", description:"Exercitation amet in laborum minim. Nulla et veniam laboris dolore fugiat aliqua et sit mollit. Dolor proident nulla mollit culpa in officia pariatur officia magna eu commodo duis.\n\nAliqua reprehenderit aute qui voluptate dolor deserunt enim aute tempor ad dolor fugiat. Mollit aliquip elit aliqua eiusmod. Ex et anim non exercitation consequat elit dolore excepteur. Aliqua reprehenderit non culpa sit consequat cupidatat elit")
     let t4 = Ticket(subject: "Proident est nisi non irure", description: "Aute mollit ex nulla id culpa nisi enim amet enim duis laborum in. Eiusmod ea quis tempor voluptate deserunt tempor amet fugiat esse ea. Anim sunt nisi laboris dolor. Est ullamco voluptate dolor magna elit eu. Laboris reprehenderit irure occaecat excepteur.\n\nDo nisi commodo dolor eiusmod eiusmod non eu occaecat sunt incididunt irure consectetur do. Exercitation occaecat culpa voluptate exercitation sit. In aute eu nulla anim reprehenderit velit. Eu deserunt aliquip aute Lorem consectetur mollit non esse veniam irure excepteur cupidatat excepteur officia. Velit id et mollit cupidatat cillum elit dolor fugiat pariatur. Deserunt non eu consectetur duis ex consectetur duis eu proident")
     let t5 = Ticket(subject: "veniam ea eu minim aute", description: "Ex non officia in ullamco veniam fugiat cupidatat id aute. Quis minim et quis laborum excepteur. Non officia quis tempor quis nisi et. Aliqua tempor voluptate nulla esse sint. Id nulla consequat sint eiusmod nisi.\n\nCupidatat anim magna qui aliquip. Anim deserunt sint incididunt labore aliquip. Reprehenderit magna deserunt reprehenderit irure Lorem nulla est officia cupidatat in. Dolore ullamco veniam proident consectetur amet ad nulla amet commodo enim occaecat. Sint fugiat dolor aliqua proident. Ex enim eu pariatur qui officia cupidatat adipisicing esse qui fugiat. Do mollit quis cillum quis qui occaecat labore")
    
    tickets.append(t1)
    tickets.append(t2)
    tickets.append(t3)
    tickets.append(t4)
    tickets.append(t5)
    
    return tickets
    
  }
  
}
