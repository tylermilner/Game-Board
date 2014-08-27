Pod::Spec.new do |s|
  s.name         = "TJMGameBoard"
  s.version      = "1.0.0"
  s.summary      = "A simple game board written in Objective-C."
  s.description  = "I wrote this to implement a simple game board model object."
  s.homepage     = "https://github.com/Cubd/Game-Board"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Cubd" => "tyler@tylermilner.com" }
  s.platform     = :ios
  s.ios.deployment_target = "5.0"
  s.source       = { :git => "https://github.com/Cubd/Game-Board.git", :tag => "1.0.0" }
  s.source_files  = "Source/**/*.{h,m}"
  s.exclude_files = "Test Project"
  s.requires_arc = true
  s.dependency "TJMTwoDimensionalArray", "~> 1.0"
end
