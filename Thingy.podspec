Pod::Spec.new do |s|
  s.name                      = "Thingy"
  s.version                   = "1.0.0"
  s.summary                   = "Device detection and querying library."
  s.homepage                  = "https://github.com/bojan/Thingy"
  s.license                   = "MIT"
  s.author                    = "Bojan Dimovski"
  s.social_media_url          = "http://twitter.com/bojand"

  s.ios.deployment_target     = '8.0'
  s.tvos.deployment_target    = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source                    = { :git => "https://github.com/bojan/Thingy.git", :tag => s.version }
  s.source_files              = 'Sources/*.swift'
end
