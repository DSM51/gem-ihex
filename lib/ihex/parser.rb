module IHex
	class Parser
		def parse(content)
			bin = Binary.new
			
			normalize(content).split("\n").each do |line|
				record = Record.new(line)
				
				next if record.eof?

				record.content.each_with_index do |byte, index|
					bin[record.address+index] = byte
				end
			end

			bin
		end
		
		private
		
		def normalize(content)
			content.gsub "\r\n", "\n"
		end
	end
end

