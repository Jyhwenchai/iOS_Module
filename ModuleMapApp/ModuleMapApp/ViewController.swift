//
//  ViewController.swift
//  ModuleMapApp
//
//  Created by 蔡志文 on 1/17/23.
//

import UIKit
import PureSwiftFramework
import PureOCFramework
import SwiftFrameworkMix

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        PureSwiftFrameworkTest.test()
        PureOCFrameworkTest.test()
        SwiftFrameworkMixTest.test()
    }

}

