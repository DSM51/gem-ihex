module IHex
	class Record
		attr_reader :data
	
		def initialize(data)
			fail "invalid data" unless is_valid? data
		
			@data = data
		end
	
		def size
			data[1..2].to_i(16)
		end

		def address
			data[3..6].to_i(16)
		end

		def type
			@type ||= case data[7..8]
			when "00" then :data
			when "01" then :eof
			else fail "type not supported"
			end
		end

		def content
			data[9..-3]
				.split("")
				.each_slice(2)
				.map(&:join)
				.map{|x|x.to_i(16)}
		end

		def crc
			data[-2..-1].to_i(16)
		end

		def is_valid?(data)
			data[1..-1]
				.each_char
				.each_slice(2)
				.map(&:join)
				.map { |x| x.to_i(16) }
				.inject(0, :+) %256
		end
		
		def eof?
			type == :eof
		end
	end
end

