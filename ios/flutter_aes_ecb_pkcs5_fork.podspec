#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_aes_ecb_pkcs5_fork'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'git@github.com:shareven/flutter_aes_ecb_pkcs5_fork.git'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'smallbuer' => 'smallbuer@gmail.com' } # <---- Not sure about what to use here but it doesn't seem like it matters
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '8.0'
end