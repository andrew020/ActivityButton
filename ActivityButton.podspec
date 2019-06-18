#
# Be sure to run `pod lib lint ActivityButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    
    s.name = 'ActivityButton'
    s.version = '0.1.0'
    s.summary = 'A button with UIActivityIndicatorView.'
    
    s.homepage = 'https://github.com/andrew020/ActivityButton'
    s.license = { :type => 'MIT', :file => 'Components/LICENSE' }
    s.author = { 'Andrew Leo' => 'andrew2007@foxmail.com' }
    s.source = { :git => 'https://github.com/andrew020/ActivityButton.git', :tag => s.version.to_s }
    s.description = '\
    A button with UIActivityIndicatorView.\
    If this button has image, UIActivityIndicatorView will be the same frame with imageView, and hide imageView when UIActivityIndicatorView showing.\
    If only has text, UIActivityIndicatorView will be the same center with textLabel, and hide imageView when UIActivityIndicatorView showing.\
    When showActivity is true, button will be disable.\
    '
    
    s.ios.deployment_target = '9.0'
    s.swift_version = '5.0'
    s.requires_arc = true
    
    s.default_subspec = 'Core'

    s.subspec 'Core' do |core|
        core.source_files = 'Components/ActivityButton.swift'
        
        core.framework = 'UIKit'
    end
    
    s.subspec 'ReactiveProperty' do |reactive|
        reactive.source_files = 'Components/ActivityButton_Reactive.swift'
        
        reactive.dependency 'ActivityButton/Core'
        reactive.dependency 'ReactiveSwift'
        reactive.dependency 'ReactiveCocoa'
    end
    
end
