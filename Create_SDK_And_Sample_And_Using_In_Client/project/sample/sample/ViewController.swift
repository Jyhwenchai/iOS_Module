//
//  ViewController.swift
//  sample
//
//  Created by 蔡志文 on 1/13/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension UIViewController {
    
    @_dynamicReplacement(for: preferredStatusBarStyle)
    var customStatusStyle: UIStatusBarStyle {
        .default
    }
}
