Pod::Spec.new do |s|
s.name         = "QYWKUtils"
s.version      = "0.0.1"
s.summary      = "A short description of QYWKUtils."
s.description  = <<-DESC
                 千宇微课工具类组件
DESC
s.homepage     = "https://github.com/STUDYALLTHETIME/QYWKUtils"
s.license      = "MIT"
s.author             = { "free" => "851083075@qq.com" }
s.platform     = :ios, "9.0"
s.requires_arc = true
s.source       = { :git => "https://github.com/STUDYALLTHETIME/QYWKUtils.git", :tag => "#{s.version}" }

    s.subspec 'Core' do |s1|
    s1.source_files  = "Classes", "Classes/**/*.{h,m,c}"
    s1.resource_bundles = {'QYWKUtils' => ['Classes/**/*.{png,jpeg}']}
    s1.dependency 'ReactiveObjC'
    end
end