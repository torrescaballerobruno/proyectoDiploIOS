//
//  User.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 04/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import Foundation
import UIKit

struct ServerUser{
    var username: String
    var name: String
    var lastname: String
    var age: Int
    var address: Address
    var phone: String
    var userImage: UIImage
    var services: [Service]
    var rating: Int
}
