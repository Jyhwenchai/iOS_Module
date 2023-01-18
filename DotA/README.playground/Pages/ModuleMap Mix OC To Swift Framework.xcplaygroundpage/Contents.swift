//: [Previous](@previous)

//: # 在 Swift Framework 中使用 OC 类

/*:
  默认的在 `Swift Framework` 中创建 `OC` 类会提示错误，所以我们需要创建子 `module` 来解决这个问题。
 
 ## 子 module
 
 1. 新建一个 `Swift Framework` 名为 `SwiftFrameworkMix`，新建一个 `Swift` 文件并新建类 `SwiftFrameworkMixTest`，该类用于测试子模块的使用。
 2. 在这个 `Framework` 下直接创建一个 `OC` 类是无法使用的，Xcode 会直接提示错误，我们需要新建目录 `OCSubModule`，在一个目录下新建 `OC` 类不会报错，在这里创建 `OCSubModule.h` 及 `OCSubModuleTest` 类，最后在 `OCSbuModule.h` 中 `#import "OCSubModuleTest.h"`。
 3. 为了在 `SwiftFrameworkMixTest` 测试类中可以使用 `OCSbuModuleTest` 我们需要创建一个子 `module`，在 `OCSubModule` 目录下新建 `module.modulemap`，该 `modulemap` 做为子模块管理 `OCSubModule` 的所有类。`module.modulemap` 中的内容如下：
 
 ```Swift
 module OCSubModule {
     header "OCSubModule.h"
     export *
 }
 ```
  header "OCSubModule.h" 声明了模块 `OCSubModule` 向外暴露的可以导入的头文件。`export *` 表示导出当前模块下用到的所有子模块。最后还需要在 `Build Settings` -> `Import Paths` 导入 `OCSubModule` 目录所在路径，这样就可以在 `SwiftFrameworkMixTest` 中导入 `OCSubModule` 模块(`import OCSubModule`)然后测试调用该模块下的类了。
 
```Swift
 import OCSubModule // 可以直接 OCSubModuleTest.text() 成功
 
 public class SwiftFrameworkMixTest {
     public static func test() {
         print("- \(self) testing.")
         OCSubModuleTest.test()
     }
 }
 ```
 ## 子模块的子模块
 
 你还可以对子模块中的类进行模块化分类。
 
 1. 在 `OCSubModule` 下新建目录 `Child`，在`Child` 下新建类 `ChildTest`，然后修改在 `OCSubModule` 目录下的 `module.modulemap` 内容为：
 
 ```swift
 
 module OCSubModule {
     header "OCSubModule.h"
     export *
     
     module Child {  // OCSubModule 的子 module
       header "Child/ChildTest.h"
       export *
     }

 }

 ```
 
 这样你就可以在 `SwiftFrameworkMixTest` 中通过导入 `import OCSubModule.Child`，然后使用 `ChildTest` 类了。
 
 - Note:
  在 `Child` 新增 `module.modulemap` 无效？
 
 ## modulemap 中的 export
 
 `export Name` 可以指定导出某个模块，或者是 `export *`，下面的示例中当你在 `SwiftFrameworkMixTest` 导入 `import Export.Derived` 后，你可以同时使用 `Base` 和 `Derived` 类，而不需要在 `import Export.Base`。
 
 ```swift
 module Export {
   module Base {
     header "Base.h"
   }

   module Derived {
     header "Derived.h"
     export Base
   }
 }
 ```
 
 如果在 `Derived.h` 类中导入了 `#import "Base.h"`，那么 `modulemap` 内容就可以改为：
  ```swift
 module Export {
   module Base {
     header "Base.h"
   }

   module Derived {
     header "Derived.h"
     export *
   }
 }
 ```
 
 ## modulemap 中的 explicit
 
 使用 `explicit` 声明的 `module`，在导入时必须显示的指定否则无法使用该模块下的类，如：
 
 ```
 module Explicit {
   explicit module A {  // explicit 只能在子模块中使用，在没有一个目录时也会帮你生成对应的 module
     header "A.h"
     export *
   }

   explicit module B {
     header "B.h"
     export *
   }
 }
 ```
 
 回到 `SwiftFrameworkMixTest` 中，导入 `import Explicit`，则会发现无法使用 `A`、`B` 两个模块下的类，只有显示的使用 `import Explicit.A` 导入 `A` 模块 这样才能使用对应模块下的类。如果不使用 `explicity` 则在 `import Explicit` 之后就可以直接使用 `A`、`B` 模块下的类。
 
 ## 参考阅读
 1. [混编framework实践](https://www.jianshu.com/p/4969b1c47bc8)
 2. [Custom framework module map(.modulemap) and Defines Module(DEFINES_MODULE)](https://stackoverflow.com/questions/30704268/no-umbrella-header-found-for-target-module-map-will-not-be-generated/57665560#57665560)
 3. [LLVM的 Modules](https://www.stephenw.cc/2017/08/23/llvm-modules/)
 4. [Modules](https://clang.llvm.org/docs/Modules.html)
 */

//: [Next](@next)
