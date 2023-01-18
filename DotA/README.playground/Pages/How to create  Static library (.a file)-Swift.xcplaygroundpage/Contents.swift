//: [Previous](@previous)

//: # 如何创建 Swift 静态库(.a文件)？

/*:
## 一、创建静态库项目：
 1. 打开 Xcode，选择 file -> new -> project, 选择 static library 并输入库的名称 `HelloWorld` 然后点击下一步完成创建。
 2. 在项目的 `Build Settings` 中找到 `Deployment` 选择可适配的系统的最低版本(如：iOS Deployment Target)。
 3. 默认在项目目录下会新建与项目同名的 .swift 文件，你可以选择删除或保留。我们可以新建一个 swift 文件命名为 `Logger`。编写 Logger 类便于测试。**注意：需要将要暴露给外部使用的类、属性和方法等使用 public 进行修饰**
 
 ---
  
## 二、创建静态库(.a文件)
1. 选择 **iOS Simulator** 以及 **Any iOS Device** 编译并运行第一部中创建的项目，你只会看到编译成功的提示。
2. 在编译成功后你可以按 `Cmd + ,` 打开 Xcode 配置文件找到 `Locations`，找到 `Drived Data` 并打开所设置的目录文件，在该目录下可以找到所有你所运行过的项目。
3. 在 `DrivedData` 目录下，我们找到之前所创建的静态库项目目录，可以看到在 Build -> Products 下有两个目录 `Debug-iphonesos` 和 `Debug-iphonesimulator`，在这两个目录下都放着我们最终所需要的 `.a` 文件。（注意：因为项目开发中需要在模拟器和真机进行调试所以这里有两个目录以提供不同的支持）
 
 ![](01.jpg)
 
 ---
 
 ## 三、合并 `Debug-iphonesos` 和 `Debug-iphonesimulator` 生成的 .a 文件
 1. 在与静态库项目同级目录下创建 `HelloWorldMerge` 目录，然后拷贝 `Debug-iphonesos` 和 `Debug-iphonesimulator` 对应目录下的 `.a` 文件到该目录并重命名为 `HelloWorld_device.a` 和 `HelloWorld_simulator.a`。
 
 2. 在终端 `HelloWorldMerge` 下执行命令 `lipo -create "HelloWorld_device.a" "Logger_simulator.a" -output "HelloWorld.a"`。执行完成后可以看到在 `HelloWorldMerge` 目录下多了一个 `HelloWorld.a` 文件，这就是最终我们所需要的文件。
 
 3. 最后在与静态库项目同级目录下创建 `HelloWorldSDK` 目录，拷贝最终生成的 `HelloWorld.a` 文件到此。然后创建 `HelloWorld.swiftmodule` 目录，拷贝之前 `Debug-iphonesos` 或 `Debug-iphonesimulator` 下的 `HelloWorld.swiftmodule` 目录下的文件到我们自己创建的同名 `HelloWorld.swiftmodule` 目录下(注意记得合并两个 Project 目录下的文件)。到此，我们可以将 `HelloWorldSDK` 用于真实的项目中。最终 `HelloWorldSDK` 目录结构如下：
 
    ![](02.jpg)
 
 ---
 
 ## 四、测试
 新建名为 `TestHelloWorldSDK` 的 `iOS` 项目，将之前的 `HelloWorldSDK` 文件夹拖到项目下，默认的系统会帮你在 `Build Phases -> Link Binary With Librarys` 中引入 `HelloWorld.a` 文件，并在 `Build Settings -> Search Paths -> Library Search Paths` 中为你填写好了库的路径，我们要做的最后一件事是搜索 `Import Paths` 并将 `Library Search Paths` 中的路径拷贝到这里。最后就可以在  `ViewController` 中导入 `HelloWorld` 库并然后调用 `Logger` 类中的方法，最后运行并测试结果。
 
 ![](03.jpg)
*/


//: [Next](@next)
