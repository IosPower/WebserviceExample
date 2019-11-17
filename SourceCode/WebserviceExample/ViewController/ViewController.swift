//
//  ViewController.swift
//  WebserviceExample
//
//  Created by Admin on 16/11/19.
//  Copyright © 2019 Piyush. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callGetAPI()
    }
    
    func callGetAPI()  {
        loginViewModel.callGETAPI()
        
        
    }
}

