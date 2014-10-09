Pod::Spec.new do |s|
  s.name     = 'SISecondaryWindowRootViewController'
  s.version  = '0.1'
  s.platform = :ios
  s.license  = 'MIT'
  s.summary  = 'This view controller is supposed to be used as root view controller of secondary window.'
  s.homepage = 'https://github.com/Sumi-Interactive/SISecondaryWindowRootViewController'
  s.author   = { 'Sumi Interactive' => 'developer@sumi-sumi.com' }
  s.source   = { :git => 'https://github.com/Sumi-Interactive/SISecondaryWindowRootViewController.git',
                 :tag => '0.1' }

  s.description = 'It transfer the responsibility of controlling rotation and status bar to the current view controller of main window.'

  s.requires_arc = true
  s.source_files = 'SISecondaryWindowRootViewController/*.{h,m}'
end
