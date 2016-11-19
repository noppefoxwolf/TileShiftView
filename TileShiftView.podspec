Pod::Spec.new do |s|
  s.name             = 'TileShiftView'
  s.version          = '0.1.0'
  s.summary          = 'This view is a TileShift animation view of the specified image.'

  s.description      = <<-DESC
This view is a TileShift animation view of the specified image.
You can also select the index you want to ignore.
                       DESC

  s.homepage         = 'https://github.com/noppefoxwolf/TileShiftView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tomoya Hirano' => 'cromteria@gmail.com' }
  s.source           = { :git => 'https://github.com/noppefoxwolf/TileShiftView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'TileShiftView/Classes/**/*'
  s.dependency 'RxSwift'
end
