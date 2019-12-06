//
//  ServiceServices.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 05/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

let serviceServices = ServiceServices()

class ServiceServices{
    
    private let collection: String = "service"
    private var getRef: Firestore!
    private var ref: DocumentReference? //is the current user

    init(){
        getRef = Firestore.firestore()
    }

    func getUser (username: String) -> Bool {
        var f = true
        getRef.collection(collection).document(username).getDocument { (document, error) in
            if let document = document, document.exists{
                self.ref = document.reference
            }else if let error = error {
                print(error.localizedDescription)
                f = false
            }
        }
        return f
    }
    
    /*func getAllServices(){
        getRef.collection(collection).getDocuments { (<#QuerySnapshot?#>, <#Error?#>) in
            <#code#>
        }
    }*/
    
    func getAllServices()->[Service]{
        var services = [Service]()
        getRef.collection(collection).getDocuments { (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }else{
                for document in querySnapshot!.documents {
                    let id = document.documentID
                    let values = document.data()

                    let description = values["description"] as? String ?? "sin valor"
                    let price = values["price"] as? String ?? "sin precio"
                    let rating = values["rating"] as? String ?? "sin valor"
                    let hirings = values["hirings"] as? String ?? "sin precio"

                    services.append(Service(id: id, description: description, price: Double(price)!, rating: Int(rating)!, pictures: nil, hirings: Int(hirings)!, comments: nil))

                }
            }
        }
        return services
    }
}
