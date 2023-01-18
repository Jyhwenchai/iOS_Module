//
//  ViewController.swift
//  TestHelloWorldSDK
//
//  Created by 蔡志文 on 1/12/23.
//

import UIKit
import HelloWorld

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        HelloWorld.helloworld()
        Logger.printInfo()
    }


}

