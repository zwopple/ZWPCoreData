Pod::Spec.new do |s|
  s.name = "ZWPCoreData"
  s.summary = "Shortcuts for working with Core Data on iOS and OS X"
  
  s.version = "1.0.0"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.homepage = "https://github.com/zwopple/ZWPCoreData"
  s.author = { "Zwopple | Creative Software" => "support@zwopple.com" }
  s.ios.deployment_target = "6.0"
  s.osx.deployment_target = "10.8"
  s.source = { :git => "https://github.com/zwopple/ZWPCoreData.git", :tag => "1.0.0" }
  s.requires_arc = true
  s.source_files = "ZWPCoreData/"
  s.frameworks = "CoreData"
  
end