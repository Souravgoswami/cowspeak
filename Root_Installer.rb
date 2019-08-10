#!/usr/bin/env ruby
#Encoding: UTF-8
VERSION = 1.1

%w(io/console net/http fileutils).each(&method(:require))
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

In = Class.new do
	define_singleton_method(:gets) do |*arg|
		IO.new(STDOUT.fileno).tap { |x| x.write(*arg.map { |x| String === x ? x.colourize : x.to_s.colourize }.join("\n") ) }.close
		STDIN.gets.strip.downcase
	end
end

define_method(:detect_os) do
	begin
		STDOUT.puts("Attempting to detect the current operating system".colourize)
		STDOUT.puts "Detected #{IO.readlines('/etc/os-release').select { |i| i.start_with?('NAME') }[-1].to_s.split('=')[1].strip.undump} #{RUBY_PLATFORM}".colourize
		true
	rescue Exception
		STDOUT.puts "Can't determine the OS".colourize
	end
end

def help
	message = if system("sh -c 'type -p dpkg > /dev/null'")
		"\nTips: If you are using debian / debian based system, you can install the deb file: "\
			'https://github.com/Souravgoswami/cowspeak-deb'
		else ''
	end

	opts = "--help / -h       Shows this help and exit. * --install / -i    Installs cowspeak. *
			--licence / -l    Shows the licence. * --uninstall / -u  Uninstalls cowspeak."
				.split(?*).map { |x| "\t#{File.basename($0)} #{x.strip}" }.join(?\n)

	STDOUT.puts <<~EOF.each_line.map(&:colourize).join
		Cowspeak speaks a quote on your terminal.
		It is customizable. It can also show you useful system information.
		This is cowspeak installer #{VERSION}#{message}

		Usage:
		#{opts}
	EOF
end

def install
	throw :WriteError if !File.writable?(PATH) && File.exist?(PATH)
	STDOUT.puts("Downloading file from https://raw.githubusercontent.com/Souravgoswami/cowspeak-deb/master/cowspeak/usr/bin/cowspeak. Press Enter to Confirm.".colourize)
	return nil unless STDIN.getch == ?\r

	loop do
		if File.directory?(PATH)
			STDOUT.puts("Looks like #{PATH} is a directory. Press Enter to remove the #{PATH} directory before proceeding...")
			return nil unless STDIN.getch == ?\r
			FileUtils.rm_rf(PATH)
		else break
		end
	end

	anim, str = %W(\xE2\xA0\x82 \xE2\xA0\x92 \xE2\xA0\xB2 \xE2\xA0\xB6), 'Please Wait'
	t = Thread.new { loop while str.size.times { |i| print(" \e[2K#{anim.rotate![0]} #{str[0...i]}#{str[i].swapcase}#{str[i.next..-1]}#{?..*((i += 1) % 4)}\r") || sleep(0.15) } }

	data = Net::HTTP.get(URI('https://raw.githubusercontent.com/Souravgoswami/cowspeak-deb/master/cowspeak/usr/bin/cowspeak'))
	t.kill

	File.write(PATH, data)
	STDOUT.puts("Downloaded #{File.basename(PATH)} to #{File.dirname(PATH)}".colourize("\n\n"))

	STDOUT.puts("Attempting to change the permission of /usr/bin/cowspeak to 755. Press Enter to Confirm.".colourize)
	return nil unless STDIN.getch == ?\r
	File.chmod(0755, PATH)
	STDOUT.puts("Changed permission to 755".colourize("\n\n"))

	STDOUT.puts("Attempting to change the owner and group of #{PATH} to root. Press Enter to Confrim.".colourize)
	return nil unless STDIN.getch == ?\r
	File.chown(0, 0, PATH)
	STDOUT.puts("Changed the owner and group to root".colourize("\n\n"))

	STDOUT.puts("Attempting to move #{PATH} to /usr/bin/ directory. Press Enter to Confirm.".colourize)
	return nil unless STDIN.getch == ?\r
	FileUtils.mv(PATH, '/usr/bin/')
	STDOUT.puts("\e[38;5;10mMoved #{PATH} to /usr/bin/\e[0m\n\n")

	STDOUT.puts("All Done!! Just run /usr/bin/cowspeak -dl to Download the data files to /usr/share/cowspeak".colourize)
end

def uninstall
	exit if In.gets(':: Do you want to remove cowspeak? (Y/n): ') == ?n
	STDOUT.puts(':: If you find any bug or for feature request go to https://github.com/Souravgoswami/cowspeak-deb/issues/new'.colourize)

	%w(/usr/bin/cowspeak /usr/share/man/man1/cowspeak.1.gz /usr/share/cowspeak/).select do |x|
		File.exist?(x).tap { |y| STDOUT.puts y ? ":: Found: #{x.dump}" : ":: Not Found: #{x.dump}" }
	end.each do |f|
		if File.directory?(f)
			return nil unless In.gets(":: Will Remove\n#{Dir.glob("#{f}/**/**").join("\n")}\nPress Enter to confirm: ").empty?
			FileUtils.rm_r(f)
			STDERR.puts("Deleted #{f}".colourize)
		elsif File.file?(f)
			return nil unless In.gets(":: Attempting to remove #{f}. Press Enter to confirm: ").empty?
			File.delete(f)
			STDERR.puts("Removed #{f}".colourize)
		end
	end.empty?.tap { |x| STDOUT.puts "Cowspeak is not installed. Nothing to do. Run `#{$PROGRAM_NAME} --install` to install cowspeak".colourize if x }
end

if ARGV.any? { |x| x =~ /\A-(-\binstall\b|\bi\b)/ }
	begin
		detect_os && install
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
	rescue SignalException, Interrupt, SystemExit
		STDOUT.puts
	rescue Exception => e
		Kernel.warn("An Exception Caught:\n#{e.to_s.each_line.map { |err| "\t" << err }.join }\n".colourize + ?*.*((e.to_s.length + 8)).colourize)
		Kernel.warn("Error in:\n#{e.backtrace.map { |err| "\t#{err}\n" }.join}".colourize)
	end

elsif ARGV.any? { |x| x =~ /\A-(-\buninstall\b|\bu\b)/ }
	begin
		detect_os && uninstall
	rescue Errno::EACCES
		STDOUT.puts('Cannot remove cowspeak. Permission Denied.'.colourize)
		STDOUT.puts('Try running this as root'.colourize)
	rescue SignalException, Interrupt, SystemExit
		STDOUT.puts
	rescue Exception => e
		Kernel.warn("An Exception Caught:\n#{e.to_s.each_line.map { |err| "\t#{err}" }.join }\n".colourize + ?*.*(e.to_s.length.+(8)).colourize)
		Kernel.warn "Error in:\n#{e.backtrace.map { |err| "\t#{err}\n" }.join }".colourize
	end

elsif ARGV.any? { |x| x =~ /\A-(-\blicence\b|\bl\b)/ }
	d, i, chars = false, 0, %w(| / - \\)
	Thread.new { STDOUT.print("\e[2K#{chars[(i += 1) % chars.size].colourize} #{'Downloading licence! Please wait...'.colourize}\r") || sleep(0.1) until d }

	begin
		puts Net::HTTP.get(URI('https://raw.githubusercontent.com/Souravgoswami/cowspeak/master/LICENSE')).each_line.map(&:colourize).join
	rescue Exception
		STDERR.puts "Unable to Download the licence. Perhaps try again?".colourize
	ensure
		d = true
	end

else
	help
end
