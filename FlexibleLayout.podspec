Pod::Spec.new do |s|
  s.name             = "FlexibleLayout"
  s.version          = "0.1.0"
  s.summary          = "Distributing flexible spaces between views made easy"

  s.description      = <<-DESC
  FlexibleLayout is easy helper library for building flexible spaces between views in your layout in declarative way.
Uses auto-layout underneath and you can use it with your favorite libraries, or pure constraint APIs.
                       DESC

  s.homepage         = "https://github.com/Kacper20/FlexibleLayout"
  s.license          = 'MIT'
  s.author           = { "Kacper Harasim" => "kacper.harasim@gmail.com" }
  s.source           = { :git => "https://github.com/Kacper20/FlexibleLayout.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/KacperHarasim'

  s.ios.deployment_target = '8.0'

  s.requires_arc = true
  s.source_files = 'Source/*.swift'
end