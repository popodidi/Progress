#
# Be sure to run `pod lib lint Progress.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Progress'
  s.version          = '1.0.1'
  s.summary          = 'A iOS progress indicator management tool'

  s.description      = <<-DESC
A elegant progress indicator management tool that allows you to start/update/end progress in different views.
                       DESC

  s.homepage         = 'https://github.com/popodidi/Progress'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'popodidi' => 'changhao@sendbest.cc' }
  s.source           = { :git => 'https://github.com/popodidi/Progress.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Progress/Classes/**/*'
end
