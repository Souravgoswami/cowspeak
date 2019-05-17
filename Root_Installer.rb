#!/usr/bin/env ruby
%w(io/console net/http fileutils).each { |g| require(g) }
PATH = File.join(File.dirname(__FILE__), 'cowspeak')
STDOUT.sync = true

class String
	@@colours = [[154, 184, 208, 203, 198, 164, 129, 92], [63, 33, 39, 44, 49, 83, 118], [40,41,42,43,211, 210, 209, 208]].tap { |itself| itself.concat(itself.map(&:reverse)) }

	define_method(:colourize) do |final = ''|
		colour = @@colours.sample
		colour_size = colour.size - 1
		index, div, val = 0, length / colour_size, ''
		div = 1 if div == 0
		colour_size -= 1

		each_char.with_index do |c, i|
			index += 1 if (i % div == 0 && index < colour_size) && i > 1
			val.concat("\e[38;5;#{colour[index]}m#{c}")
		end

		val + "\e[0m" + final
	end
end

define_method(:detect_os) do
	STDOUT.puts("Detecting the current operating system".colourize)
	if File.exist?('/etc/os-release')
		begin
			STDOUT.puts "Detected #{IO.readlines('/etc/os-release').select { |i| i.start_with?('NAME') }[-1].split('=')[1][1..-3]} #{RUBY_PLATFORM}".colourize
			true
		rescue Exception
			STDOUT.puts "Can't determine the OS".colourize
		end
	end
end

define_method(:main) do
	throw :WriteError if !File.writable?(PATH) && File.exist?(PATH)
	STDOUT.puts("Downloading file from https://raw.githubusercontent.com/Souravgoswami/cowspeak-deb/master/cowspeak/usr/bin/cowspeak. Press Enter to Confirm.".colourize)
	return nil unless STDIN.getch == "\r"
	File.write(PATH, Net::HTTP.get(URI('https://raw.githubusercontent.com/Souravgoswami/cowspeak-deb/master/cowspeak/usr/bin/cowspeak')))
	STDOUT.puts("Downloaded #{File.basename(PATH)} to #{File.dirname(PATH)}".colourize("\n\n"))

	STDOUT.puts("Attempting to change the permission of /usr/bin/cowspeak to 755. Press Enter to Confirm.".colourize)
	return nil unless STDIN.getch == "\r"
	File.chmod(0755, PATH)
	STDOUT.puts("Changed permission to 755".colourize("\n\n"))

	STDOUT.puts("Attempting to change the owner and group of #{PATH} to root. Press Enter to Confrim.".colourize)
	return nil unless STDIN.getch == "\r"
	File.chown(0, 0, PATH)
	STDOUT.puts("Changed the owner and group to root".colourize("\n\n"))

	STDOUT.puts("Attempting to move #{PATH} to /usr/bin/ directory. Press Enter to Confirm.".colourize)
	return nil unless STDIN.getch == "\r"
	FileUtils.mv(PATH, '/usr/bin/')
	STDOUT.puts("\e[38;5;10mMoved #{PATH} to /usr/bin/\e[0m\n\n")

	STDOUT.puts("All Done!! Just run /usr/bin/cowspeak -dl to Download the data files to /usr/share/cowspeak".colourize)
end

begin
	detect_os && main
rescue UncaughtThrowError
	STDOUT.puts("Can't open cowspeak for write!!".colourize)
rescue SocketError
	STDOUT.puts("An active internet connection is required to download the source code. May be you don't have an internet connection?".colourize)
rescue OpenSSL::SSL::SSLError
	STDOUT.puts("An active internet connection is required to download the source code. There may be an internet issue?".colourize)
rescue Errno::EACCES
	STDOUT.puts("Cannot move #{PATH} to /usr/bin/cowspeak - Access Denied. Please try this running as root?".colourize)
	STDOUT.puts("The downloaded source file is #{PATH}".colourize)
rescue Errno::EPERM
	STDOUT.puts("Cannot change ownership and group of #{PATH} to root - Access Denied. Please try this running as root?".colourize)
	STDOUT.puts("The downloaded source file is #{PATH}".colourize)
rescue Errno::ENOTTY
	STDOUT.puts("No TTY found for inputs. Please try running #{File.basename(__FILE__)} in a terminal".colourize)
rescue SystemExit, Interrupt
	STDOUT.puts
rescue Exception => e
	length = e.to_s.length
	Kernel.warn("An Exception Caught:\n#{e.to_s.each_line.map { |err| "\t" << err }.join }\n" + '*' * (length + 8))
	Kernel.warn("Error in:\n")
	Kernel.warn(e.backtrace.map { |err| "\t" + err } )
end
