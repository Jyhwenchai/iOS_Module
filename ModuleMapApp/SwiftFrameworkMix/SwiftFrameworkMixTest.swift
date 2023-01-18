//
//  SwiftFrameworkMixTest.swift
//  SwiftFrameworkMix
//
//  Created by 蔡志文 on 1/17/23.
//

import Foundation
import OCSubModule // 可以直接 OCSubModuleTest.text() 成功
import Explicit.A  // 如果使用 import MyLib 则 A.text() 失败，这就是 explicit 声明带来的影响
import Export.Derived   // 可以同时使用 Derived 和 Base，这就是 export 的作用
//import Export.Base  // 无法使用 Derived
import OCSubModule.Child

public class SwiftFrameworkMixTest {
    public static func test() {
        print("- \(self) testing.")
        OCSubModuleTest.test()
        ChildTest.test()
        A.test()
//        B.test()  // 失败
        Base.test()
        Derived.test()
    }
}
