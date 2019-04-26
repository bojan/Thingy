Pod::Spec.new do |spec|
  spec.name                      = "Thingy"
  spec.version                   = "2.1.0"
  spec.summary                   = "Device detection and querying library."
  spec.homepage                  = "https://github.com/bojan/Thingy"
  spec.license                   = "MIT"
  spec.author                    = "Bojan Dimovski"

  spec.ios.deployment_target     = "8.0"
  spec.tvos.deployment_target    = "9.0"
  spec.watchos.deployment_target = "2.0"

  spec.source                    = { :git => "https://github.com/bojan/Thingy.git", :tag => spec.version }
  spec.source_files              = "Sources/*.swift"
end
