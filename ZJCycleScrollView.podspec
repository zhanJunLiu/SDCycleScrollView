Pod::Spec.new do |s|

s.name         = "ZJCycleScrollView"
s.version      = "1.90"
s.summary      = "增加自动识别图片主题色功能"

s.homepage     = "https://github.com/zhanJunLiu/ZJCycleScrollView"

s.license      = "MIT"

s.author       = { "GSD_iOS" => "754308157@qq.com" }

s.platform     = :ios
s.platform     = :ios, "7.0"


s.source       = { :git => 'https://github.com/zhanJunLiu/ZJCycleScrollView.git', :tag => s.version.to_s }


s.source_files  = "SDCycleScrollView/Lib/SDCycleScrollView/**/*.{h,m}"


s.requires_arc = true


s.dependency 'SDWebImage'

end
