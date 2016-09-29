# Swift第三方框架

autolayout布局：snapKit

网络请求：Alamofire

**Swift 使用pod的方式引入第三方框架的好处：**
1. Swift中有命名空间，使用pod可以把第三方框架独立到一个命名空间，不容易冲突。便于管理。

2. 便于框架升级更新

Swift 中pod框架，必须加入这句:`use_frameworks!`
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Alamofire', '~> 3.4'
end
```
