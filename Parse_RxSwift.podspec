#
# Be sure to run `pod lib lint Parse_RxSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Parse_RxSwift'
  s.version          = '0.1.0'
  s.summary          = 'RxSwift wrapper for Parse'

  s.description      = 'A collection of wrapper classes that allow you to use RxSwift Observers in place of Parse`s callbacks.'

  s.homepage         = 'https://github.com/Konshin/Parse-RxSwift'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Konshin' => 'bodro92@yandex.ru' }
  s.source           = { :git => 'https://github.com/Konshin/Parse-RxSwift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Parse_RxSwift/Classes/*'

  s.dependency 'Parse', '~> 1.0'
  s.dependency 'RxSwift', '~> 4.0'
end
