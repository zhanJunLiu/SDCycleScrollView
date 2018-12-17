Pod::Spec.new do |s|

s.name         = "ZJCycleScrollView"
s.version      = "1.77"
s.summary      = "简单易用的图片无限轮播器. 1.74版本更新内容：1.增加支持轮播自定义cell的代理方法 2.增加禁止拖动手势api"

s.homepage     = "https://github.com/zhanJunLiu/ZJCycleScrollView"

s.license      = "MIT"

s.author       = { "GSD_iOS" => "754308157@qq.com" }

s.platform     = :ios
s.platform     = :ios, "7.0"


s.source       = { :git => 'https://github.com/zhanJunLiu/ZJCycleScrollView.git', :tag => s.version.to_s}


s.source_files  = "SDCycleScrollView/Lib/SDCycleScrollView/**/*.{h，m}"


s.requires_arc = true


s.dependency 'SDWebImage', '>= 4.0.0'

end
