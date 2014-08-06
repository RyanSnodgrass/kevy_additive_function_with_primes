class Secret
	attr_reader :ancient_chinese_secret
	def initialize(sauce)
		@ancient_chinese_secret = 7 * sauce
	end
	def secret
		@ancient_chinese_secret
	end
end