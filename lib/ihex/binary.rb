module IHex
	class Binary
		def data
			@data ||= {}
		end
	
		def [](address)
			data[address]
		end
		
		def []=(address, byte)
			@first = nil
			@last = nil

			data[address] = byte
		end
		
		def first_address
			@first ||= data.keys.min
		end
		
		def last_address
			@last ||= data.keys.max
		end
		
		def address_space
			first_address..last_address
		end
	end
end

