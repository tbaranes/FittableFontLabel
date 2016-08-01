Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.name            	= "FittableFontLabel"
s.module_name      	= "FittableFontLabel"
s.version          	= "1.2.0"
s.summary          	= "UILabel (extension) that adjust the font size to fit a rect (width and height)."
s.description      	= "UILabel (extension or subclass) that adjust the font size to fit a frame: width and height if multilines, width only if single lines"
s.homepage         	= "https://github.com/tbaranes/FittableFontLabel"
s.license      		= { :type => "MIT", :file => "LICENSE" }
s.author           	= { "Tom Baranes" => "tom.baranes@gmail.com" }
s.source           	= { :git => "https://github.com/tbaranes/FittableFontLabel.git", :tag => "#{s.version}" }

# ―――  Spec tech  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.ios.deployment_target		= '8.0'
s.requires_arc 	   			= true
s.source_files				= 'Sources/*.swift'

end
