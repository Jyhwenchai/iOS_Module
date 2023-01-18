//: [Previous](@previous)

//: # module.modulemap 基础
//:
//: 当我们创建一个 `Framework` 时，默认它是一个动态库，并默认在 `Build Settings` 设置 `Defines Module` 为 `YES`。 在编译这个动态库后，xcode 会自动为我们生成一个 `module.modulemap` 的文件，在这个文件中导出了我们需要公开给外部使用的头文件。下面分别是 `Swift Framework` 和 `OC Framework` 所产生的 `module.modulemap` 文件中内容的区别。

```Swift
framework module PureSwiftFramework {
  umbrella header "PureSwiftFramework.h"

  export *
  module * { export * }
}

module PureSwiftFramework.Swift {
  header "PureSwiftFramework-Swift.h"
  requires objc
}

```

```OC
framework module PureOCFramework {
  umbrella header "PureOCFramework.h"

  export *
  module * { export * }
}

//: 可以在项目的编译目录中找到这些文件: `Xcode` -> `Preferences` -> `Locations` -> `Derived Data`
//: ![](01.jpg)
//: ![](02.jpg)

```

/*：
我们可以自定义 `module.modulemap` 文件来替换 `Xcode` 为我们生成的 `module.modulemap` 文件，在 `PureSwiftFramework` 根目录下创建文件 `module.modulemap` 并配置 `Build Settings` -> `Packaging` -> `Module Map File` 路径为自己创建的路径。最后还需要清理之前的编译所产生的文件(Cmd+Shift+K)，然后重新编译这样就完成了一个自定义的 `module.modulemap` 文件。

需要注意的是在这个自定义的 `module.modulemap` 文件中不能添加以下内容，否则无法通过编译：
 
*/

```Swift
module PureSwiftFramework.Swift {
  header "PureSwiftFramework-Swift.h"
  requires objc
```
    
//: 以上内容 xcode 在编译后会自动的为我们加入，如果我们手动的加入就冲突了。
    
//: ## Question:
//:
//: `OC Framework` 不能自定义 `module.modulemap` ？，提示 `Redefinition of module`。
    
    

//: [Next](@next)
