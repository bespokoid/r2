# Get robot name from env var
unless (robotname = ENV['ROBOT_NAME'])
	# Get host name from machine name
	require "socket"
	robotname = Socket.gethostname
end

if File.exists?("robots/#{robotname}.rb")
	require "./robots/#{robotname}.rb"
elsif 
	puts "Can't load code for robot #{robotname}. Trying default robot"
	require "./robots/default.rb"
end