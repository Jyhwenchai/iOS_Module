//: [Previous](@previous)

//: # 使用 Workspace 管理多个 Framework Project

/*:
 在这里我们使用 Workspace 来管理多个 Framework Project，使用 Project 间的依赖进行对项目的模块化管理。
 
 ## 一、将 Project 加入到一个 Workspace 中：
 1. 如果你已经拥有一个项目，那么可以在当前项目中创建 workspace 并加入其中：可以在当前的项目中选择 `file -> Save As Workspace`，完成后会在项目的同级目录下生成一个你指定名称 `.Workspace` 文件。
 
 2. 如果你已经有了一个 workspace，想要创建一个新的项目并加入到已有的 `workspace` 中：那么你可以在创建项目的最后点击 `Create` 前指定 `Add to` 为已存在的 `workspace`，同样选择 `Group` 为存在的 `workspace`。这看起来像这样：
    
    ![](02.jpg)
 
 3. 如何你已有一个项目，现在想添加到已有的 `workspace` 中：那么可以选中项目的 .xcodeproj 文件并拖动到 `workspace` 中即可
 
 ![](03.jpg)

 
 ## 二、管理 Project 间的依赖
 当我们已经有多个项目时，可以建立项目与项目间的依赖，例如在这个示例中将在 `MainModule` 中引入 `SubModule1`、`SubModule2`、`SubModule3`，并在 `ViewController` 中导入模块并使用模块中的类。
 
 > 注意：在这里 `MainModule` 是一个 `iOS APP` 而其它的子模块是 `Framework`，注意在创建项目时的选项。
 
 1. 选择 `MainModule` -> `Targets` 中的 `MainModule`，选择 `general` -> `Frameworks,Libraries,and Embeded Content` 添加加号选择 `SubModule1.framework`、`SubModule2.framework`、`SubModule3.framework` 然后点击 `Add`。
 
 ![](04.jpg)
 
 2. 在通过上述步骤的操作后就可以在 `MainModule` 的 ViewController 中导入这些模块并调用模块中的类。
 
 ## 三、在 Project 中创建 `Framework` 依赖
 
 除了在 `Workspace` 中管理多个 `Project` 间的依赖外，我们也可以在单个 `Project` 中创建多个 `Target` 进行依赖，在这里我们指定 `Target` 的类型为 `Framework`。为 `SubModule3` 创建一个子 `Target`。
 
 ![](05.jpg)
 
 同样我们需要选择 `TARGETs` -> `SubModule3` -> `General` -> `Frameworks and Libraries` 中添加新增的 `Framework` 后才能使用。
 
 ![](06.jpg)
 
 最后我们在 `HelloWorld` 类中进行测试。
 
 ![](07.jpg)
 
 
 **参考阅读**
 
* [Modular iOS Part 1: Strangling the Monolith](https://medium.com/kinandcartacreated/modular-ios-strangling-the-monolith-4a6843a28992)
* [Modular iOS Part 2: Splitting A Workspace into Modules](https://medium.com/kinandcartacreated/modular-ios-splitting-a-workspace-into-modules-331293f1090)
* [Modular iOS Part 3: Configuration & Testing of Modules](https://medium.com/kinandcartacreated/modular-ios-part-3-configuration-testing-of-modules-2f287b19eeef)
* [Modular iOS Part 4: Sharing Configuration Between Modules](https://medium.com/kinandcartacreated/modular-ios-part-4-sharing-configuration-between-modules-b08a31490447)

 */





//: [Next](@next)
