//
//  ViewController.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 04/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func userSelected(_ sender: UIButton) {
        var foo = LoginViewController()
        
        present(foo, animated: true)
        
    }
    
    @IBAction func commerceSelected(_ sender: UIButton) {
    }
}

