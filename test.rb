require 'ihex'


parser = IHex::Parser.new
bin = parser.parse(File.read('/home/user/Desktop/dsm51-sender/rzeszot.hex'))



class String
	def pad(padding=0)
		"0" * [padding-size, 0].max + self
	end
end


class Fixnum
	def hex(padding=0)
		to_s(16).pad(padding)
	end
end


bin.address_space.each do |address|
	byte = bin[address]

	next if byte.nil?
	
	puts "#{address.hex(4)}: #{byte.hex(2)}"


end

