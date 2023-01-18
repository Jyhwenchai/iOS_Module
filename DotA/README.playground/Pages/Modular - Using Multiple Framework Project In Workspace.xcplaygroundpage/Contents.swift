//: [Previous](@previous)

//: # 使用 Workspace 管理多个 Framework Project

/*:
 在这里我们使用 Workspace 来管理多个 Framework Project，使用 Project 间的依赖进行对项目的模块化管理。
 
 ## 一、将 Project 加入到一个 Workspace 中：
 见 Swift 版本中的说明
 
 ## 二、管理 Project 间的依赖
 当我们已经有多个项目时，可以建立项目与项目间的依赖，例如在这个示例中将在 `MainModule` 中引入 `SubModule1`、`SubModule2`、`SubModule3`，并在 `ViewController` 中导入模块并使用模块中的类。
 
 > 注意：在这里 `MainModule` 是一个 `iOS APP` 而其它的子模块是 `Framework`，注意在创建项目时的选项。
 
 1. 这里我们在 `SubModule3` 中创建一个 `HelloWorld` 类，并在 `SubModule3.h` 中导入 `<SubModule3/HelloWorld.h>` 头文件以便在其它 `Project` 中可以使用 `#import` 导入 `HelloWorld` 类。同时我们还需要到 `MainModule` -> `Build Phases` -> `Headers` 中将 `Project` 中的 `HelloWorld.h` 文件移动到 `Public` 中，只有这样我们才能让外部可以访问 `HelloWorld` 类。
 
 ![](01.jpg)
 
 2. 在 `MainModule` -> `Targets` 中的 `MainModule`，选择 `general` -> `Frameworks,Libraries,and Embeded Content` 添加加号选择`SubModule3.framework` 然后点击 `Add`。

 ![](02.jpg)
 
 在通过上述步骤的操作后就可以在 `MainModule` 的 ViewController 中导入这些模块并调用模块中的类
 
 ![](03.jpg)


 */

//: [Next](@next)
