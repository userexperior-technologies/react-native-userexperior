
Pod::Spec.new do |s|
  s.name         = "react-native-userexperior"
  s.version      = "1.4.14"
  s.summary      = "RNUserExperior"
  s.homepage     = "https://github.com/userexperior-technologies/react-native-userexperior"
  s.license      = "MIT"
  s.author             = { "userexperior-technologies" => "userexperior1@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source           = { :git => 'https://github.com/userexperior-technologies/react-native-userexperior/.git', :tag => s.version }
  s.source_files = "ios/**/*.{h,m}"
  s.dependency 'UserExperior', '5.1.6'
  s.dependency 'UECrashReporter', '~> 1.0.1'
  s.dependency "React"

end

