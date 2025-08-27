Pod::Spec.new do |spec|
  spec.name         = "ImagePlaceholder"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of ImagePlaceholder."
  spec.description  = <<-DESC
                       A longer description of MyAwesomeLibrary in Markdown format.
                       
                       * Think: Why did you write this? What is the focus? What does it do?
                       * CocoaPods will be using this to generate tags, and improve search results.
                       * Try to keep it short, snappy and to the point.
                       * Finally, don't worry about the indent, CocoaPods strips it!
                       DESC
  spec.homepage     = "https://github.com/nicoprasastys93/ImagePlaceholder"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nico Prasasty S" => "nicoprasastysembiring@gmail.com" }
  spec.source       = { :git => "https://github.com/nicoprasastys93/ImagePlaceholder", :tag => "#{spec.version}" }
  spec.ios.deployment_target = "13.0"
  spec.swift_version = "5.0"
  spec.source_files  = "Sources/*.swift"
end
