#
# Be sure to run `pod lib lint Progress.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Progress'
  s.version          = '2.1.1'
  s.summary          = 'A iOS progress indicator management tool'

  s.description      = <<-DESC
Apart from any kinds of ProgresHUDs that capture the whole screen and lock the user interaction, Progress provides a more precise and elegant progress indicator. Progress allows you to add any number/kinds of progressor views into each view with only one line of code. The progress indicator can be an arbitrary combination of built-in/custom progressors. Progress helps you provide a fluent user experience in your iOS application.
                       DESC

  s.homepage         = 'https://github.com/popodidi/Progress'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'popodidi' => 'changhao@haostudio.cc' }
  s.source           = { :git => 'https://github.com/popodidi/Progress.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Progress/Classes/**/*'
end
