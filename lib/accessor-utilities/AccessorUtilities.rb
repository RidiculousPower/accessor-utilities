
module AccessorUtilities

	###################
	#  self.included  #
	###################

	def self.included( class_or_module )
		class_or_module.instance_eval do
			include AccessorUtilities::AccessorMath
			include AccessorUtilities::Swizzle
		end
	end

	###################
	#  self.extended  #
	###################

	def self.extended( class_or_module )
		class_or_module.instance_eval do
			extend AccessorUtilities::AccessorMath
			extend AccessorUtilities::Swizzle
		end
	end
	
end
