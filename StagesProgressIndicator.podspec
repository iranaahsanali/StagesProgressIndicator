Pod::Spec.new do |spec|
  spec.name           = "StagesProgressIndicator"
  spec.version        = "0.0.1"
  spec.swift_version  = "5.0"

  spec.homepage = "https://github.com/iranaahsanali/StagesProgressIndicator"
  spec.summary = "Stages Progress Indicator highly customizable  written in Swift."
  spec.screenshot = 'https://raw.githubusercontent.com/iranaahsanali/StagesProgressIndicator/master/Assets/preview_image.png'

  spec.author = { "Ahsan Ali" => "iranaahsanali@gmail.com" }
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.social_media_url = "https://www.linkedin.com/in/iranaahsanali/"

  spec.ios.deployment_target = '9.0'
  spec.source       = { :git => "https://github.com/iranaahsanali/StagesProgressIndicator.git", :tag => spec.version }

  spec.source_files = 'StagesProgressIndicator/**/*.swift'
  spec.requires_arc = true
  spec.module_name  = 'StagesProgressIndicator'
end
