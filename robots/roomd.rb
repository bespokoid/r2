# Adding current dir to LOAD_PATH to include drivers
# $:.unshift File.dirname(__FILE__)
require 'artoo'
# require 'artoo/drivers/grove_dht'

connection :beaglebone, adaptor: :beaglebone
device :led, driver: :led, pin: 'URS0'

# api host: '127.0.0.1', port: '4321'
device :button, driver: :button, pin: 'J1'

work do
	
	on button, :push => proc { puts "Button pushed" }

	every 1.second do
 		led.toggle
  	# puts "#{temp.unit} #{temp.upper}"
  end

end