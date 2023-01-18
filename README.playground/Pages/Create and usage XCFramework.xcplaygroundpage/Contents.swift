//: [Previous](@previous)

//: # XCFrameWork

//: ## Create XCFrameWork
//: 1. 打开 `Xcode` 创建 File -> New -> Project, 选择 Framework.

//: ![01](01.png)

//: 2. 在 `framework` 工厂中创建任何的测试类用于测试

//: 3. 打开终端定位到项目所在目录, 并创建输出目录 `output`

//: ![02](02.png)

//: 4. 使用 `xcodebuild` 命令对项目进行归档
/*: 下面的是对 iOS 平台的归档
 
* -scheme：设置要编译项目的名称
* -destination: 设置要编译的平台(`iOS`、`iOS Simulator`、`OS X` 等等)
* archivePath: 输出路径
* SKIP_INSTALL=NO 和 UILD_LIBRARY_FOR_DISTRIBUTION=YES 通常是需要的
 
 这里我们归档 iOS 和 iOS Simulator 版本
 
 xcodebuild archive \
 -scheme CustomFramework \
 -destination "generic/platform=iOS" \
 -archivePath ./output/CustomFramework-iOS \
 SKIP_INSTALL=NO \
 BUILD_LIBRARY_FOR_DISTRIBUTION=YES

 xcodebuild archive \
 -scheme CustomFramework \
 -destination "generic/platform=iOS Simulator" \
 -archivePath ./output/CustomFramework-Simulator \
 SKIP_INSTALL=NO \
 BUILD_LIBRARY_FOR_DISTRIBUTION=YES
 */

//: 5. 使用下面的命令创建 `xcframework`, 其中支持多个平台的 `xcframework` 会被合成到一个 `xcframework` 中。
/*:
 xcodebuild -create-xcframework \
 -framework ./CustomFramework-iOS.xcarchive/Products/Library/Frameworks/CustomFramework-iOS.framework \
 -framework ./CustomFramework-Simulator.xcarchive/Products/Library/Frameworks/CustomFramework-Simulator.framework \
 -output ./CustomFramework.xcframework
 
 最终的文件内容如下：
 
 ![03](03.png)
 
 */

//: ## 参考
//: * [https://www.appcoda.com/xcframework/](https://www.appcoda.com/xcframework/)
//: * [https://developer.apple.com/videos/play/wwdc2019/416/](https://developer.apple.com/videos/play/wwdc2019/416/)


//: [Next](@next)
