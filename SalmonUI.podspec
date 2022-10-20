
Pod::Spec.new do |spec|

  spec.name         = "SalmonUI"
  spec.version      = "5.1.0"
  spec.summary      = "Awesome SwiftUI views"

  spec.description  = <<-DESC
  A simple package with some modified SwiftUI views
                   DESC

  spec.homepage     = "https://github.com/kamaal111/SalmonUI"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "kamaal111" => "kamaal.f1@gmail.com" }

  spec.ios.deployment_target = "13.0"
  spec.swift_version = "5.2"

  spec.source        = { :git => "https://github.com/kamaal111/SalmonUI.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/SalmonUI/**/*.{swift}"

end
