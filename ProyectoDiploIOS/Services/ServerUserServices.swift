//
//  ServerUserServices.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 05/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

let serverUserServices = ServerUserServices()

class ServerUserServices{
    
    private let collection: String = "serverUser"
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
    
    func addUser (user: ServerUser)-> Bool{
        var f = true
        ref = getRef.collection(collection).addDocument(data: toArray(user), completion: {(error) in
            if let error = error{
                print(error.localizedDescription)
                f = false
            }
        })
        return f
    }
    
    func modifUser(user: ServerUser) -> Bool{
        var f: Bool = true
        guard let ref = ref else{return false}
        ref.updateData(toArray(user)) { (error) in
            if let error = error{
                print(error.localizedDescription)
                f = false
            }
        }
        return f
    }

    func deleteUser(user: ServerUser) -> Bool{
        var f: Bool = true
        guard let ref = ref else{return false}
        ref.delete { (error) in
            if let error = error{
                print(error.localizedDescription)
                f = false
            }
        }
        return f
    }
    
    private func toArray(_ user: ServerUser) ->[String: Any]{
        let datos:[String: Any] = ["username": user.username,
                                   "name": user.name,
                                   "lastname": user.lastname,
                                   "age": user.age,
                                   "address": user.address,
                                   "phone": user.phone,
                                   "rating": user.rating,
                                   "services": user.services
                                ]
        return datos
    }
}
