
Pod::Spec.new do |s|

  s.name         = "webparser"
  s.version      = "1.0.0"
  s.summary      = "A web parser for iOS."
  s.description  = "A web parser for iOS used to parse a particular div or classs"
  s.homepage     = "https://github.com/michan18/webparser.git"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author       = { "Cherian Danny Joseph" => "cheriandanny@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/michan18/webparser.git", :tag => "#{s.version}" }
  s.source_files  = "Source"
  s.framework  = "UIKit"
  s.dependency 'Kanna', '~> 4.0.0'
  s.requires_arc = true


end
