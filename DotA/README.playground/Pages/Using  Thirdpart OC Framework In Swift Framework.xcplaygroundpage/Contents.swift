//: [Previous](@previous)


//: # 在 Swift Framework 中使用第三方 OC Framework
//:
//: 由于 Swift Framework 无法使用桥接头文件来 `import` 一个 OC Framework，所以这里有一个解决这个问题的方案。

/*:
 1. 新建一个 `Swift Framework` 项目，这里命名为 `NestingOCFrameworkToSwiftFramework`。
 2. 做为测试，这里引入 `AlipaySDK.framework`，对于需要在 `Build Phases` -> `Link Binary With Libraris` 中需要添加的项目可以查阅[支付宝开发文档](https://opendocs.alipay.com/open/204/105295)，在编译通过后可进行下一步操作。
 3. 接下来在 `TARGETS` 下新建一个 `Aggregate`，名字随意这里我就叫 `AlipaySDK`，选中 `AlipaySDK` -> `Build Phases` 新建一个 `script`，并修改脚本内容如下：
 
    ```
     if [ -d "${BUILT_PRODUCTS_DIR}/AlipaySDK" ]; then
     echo "${BUILT_PRODUCTS_DIR}/AlipaySDK directory already exists, so skipping the rest of the script."
     exit 0
     fi

     mkdir -p "${BUILT_PRODUCTS_DIR}/AlipaySDK"
     cat <<EOF > "${BUILT_PRODUCTS_DIR}/AlipaySDK/module.modulemap"
     module AliPaySDK {
         header "${PROJECT_DIR}/NestingOCFrameworkToSwiftFramework/AlipaySDK.framework/Headers/AlipaySDK.h" # 注意路径的正确行
         export *
     }
     EOF
    ```
    你可以在真是项目中参考并修改
 
    ![](02.jpg)
    ![](03.jpg)
 
 4. 回到 `NestingOCFrameworkToSwiftFramework`，在 `Build Phases` -> `Target Dependenices` 中引入刚建的 `Aggregate`，然后编译 `NestingOCFrameworkToSwiftFramework` framework。在编译后对应项目的编译目录下（Products目录）会生成一个 `AlipaySDK` 的目录，里面有一个 `module.modulemap` 的文件，这个目录和文件就是 `Aggragate` 中所配置的脚本运行后产生的结果。注意看 `module.modulemap` 文件里的内容会发现它实际上就是将 header 指向了我们本地真正的 `AlipaySDK.framework/Headers/AlipaySDK.h` 所在位置。
    ![](04.jpg)
    ![](05.jpg)
 5. 最后编写一个 `test.swift` 文件进行测试
    ![](06.jpg)
 
 **备注编译目录所在位置可在 Xcode -> Preference 中找到：**
 ![](07.jpg)
 
 */

//: [Next](@next)
