# Adding current dir to LOAD_PATH to include drivers
# $:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'bundler/setup'
require 'artoo'

connection :arduino, adaptor: :firmata, port: '/dev/cu.usbmodem1411' # linux
device :temp, driver: :grove_temp, pin: 0, upper: 35, lower: 21 #, precision: 4, unit: :f

work do
	
	on temp, :lower => proc { puts "It's cold in there, like #{temp.read}#{temp.unit}" }
	on temp, :upper => proc { puts "It's hot in there, like #{temp.read}#{temp.unit}" }
	
	every 1.second do
		unless (t=temp.read).nil?
 			puts "Current temp is #{t}#{temp.unit}"
 		end  
  end

end