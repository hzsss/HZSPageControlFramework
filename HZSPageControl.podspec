Pod::Spec.new do |s|
    s.name         = "HZSPageControl"
    s.version      = "1.0.0"
    s.ios.deployment_target = '9.0'
    s.summary      = "一个简单的有过渡动画的PageControl"
    s.homepage     = "https://github.com/hzsss/HZSPageControl"
    s.license              = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "huangzishan" => "huangzishan07@163.com" }
    s.source       = { :git => "https://github.com/hzsss/HZSPageControl", :tag => s.version }
    #s.source_files  = "HZSPageControl/*"
    s.frameworks = 'Foundation', 'UIKit'
    s.vendored_frameworks = 'HZSPageControlFramework.framework'
    s.requires_arc = true
end
