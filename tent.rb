require 'artoo'

connection :arduino, adaptor: :firmata, port: '/dev/cu.usbmodem1411' # linux
device :led, driver: :led, pin: 13
api host: '127.0.0.1', port: '4321'
# device :button, driver: :button, pin: 2, interval: 0.01

work do
	# led.on
	every 1.second do
    led.on? ? led.off : led.on
  end
end