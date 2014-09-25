# Adding current dir to LOAD_PATH to include drivers
# $:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'bundler/setup'
require 'artoo'
# require 'artoo/drivers/grove_dht'

connection :arduino, adaptor: :firmata, port: '/dev/cu.usbmodem1411' # linux
device :led, driver: :led, pin: 13
device :dht, driver: :grove_dht, pin: 2
device :relay, driver: :led, pin: 3
device :temp, driver: :grove_temp, pin: 0, upper: 30, lower: 20

# api host: '127.0.0.1', port: '4321'
# device :button, driver: :button, pin: 2, interval: 0.01

work do
	
	on temp, :lower => proc { puts "It's cold in there" }
	on temp, :upper => proc { puts "It's hot in there" }

	every 1.second do
 		puts "Current temp #{dht.read}"
  	# puts "#{temp.unit} #{temp.upper}"
  end

end