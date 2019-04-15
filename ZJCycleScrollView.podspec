Pod::Spec.new do |s|

s.name         = "ZJCycleScrollView"
s.version      = "1.86"
s.summary      = "1.86提交内容：1.新增滑动动画。2.新增轮播图url校验。"

s.homepage     = "https://github.com/zhanJunLiu/ZJCycleScrollView"

s.license      = "MIT"

s.author       = { "GSD_iOS" => "754308157@qq.com" }

s.platform     = :ios
s.platform     = :ios, "7.0"


s.source       = { :git => 'https://github.com/zhanJunLiu/ZJCycleScrollView.git', :tag => 1.86}


s.source_files  = "SDCycleScrollView/Lib/SDCycleScrollView/**/*.{h,m}"


s.requires_arc = true


s.dependency 'SDWebImage' 

end
