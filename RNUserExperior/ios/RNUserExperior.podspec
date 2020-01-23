
Pod::Spec.new do |s|
  s.name         = "RNUserExperior"
  s.version      = "1.0.0"
  s.summary      = "RNUserExperior"
  s.description  = <<-DESC
                  RNUserExperior
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "userexperior-technologies" => "userexperior1@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/userexperior-technologies/react-native-userexperior/react-native-userexperior", :tag => "master" }
  s.source_files  = "ios/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

