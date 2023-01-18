//
//  Test.swift
//  NestingOCFrameworkToSwiftFramework
//
//  Created by 蔡志文 on 1/16/23.
//

import Foundation
import AliPaySDK

func test() {
    AFServiceCenter.handleResponseURL(URL(string: "")!) { response in
        if response!.responseCode == .success {
           print("success")
        } else {
            print("error")
        }
    }
}
