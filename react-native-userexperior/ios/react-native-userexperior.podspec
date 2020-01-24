
Pod::Spec.new do |s|
  s.name         = "react-native-userexperior"
  s.version      = "1.1.0"
  s.summary      = "RNUserExperior"
  s.homepage     = "https://github.com/userexperior-technologies/react-native-userexperior"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "userexperior-technologies" => "userexperior1@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source           = { :git => 'https://github.com/userexperior-technologies/react-native-userexperior.git', :tag => s.version.to_s }
  s.source_files  = "react-native-userexperior/ios/*.{h,m}"
  #s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

