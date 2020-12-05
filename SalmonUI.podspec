
Pod::Spec.new do |spec|

  spec.name         = "SalmonUI"
  spec.version      = "3.0.0"
  spec.summary      = "A simple package with some modified SwiftUI components"

  spec.description  = <<-DESC
  A simple package with some modified SwiftUI components
                   DESC

  spec.homepage     = "https://github.com/kamaal111/SalmonUI"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "kamaal111" => "kamaal.f1@gmail.com" }

  spec.ios.deployment_target = "13.0"
  spec.swift_version = "5.2"

  spec.source        = { :git => "https://github.com/kamaal111/SalmonUI.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/SalmonUI/**/*.{swift}"

end