
module AccessorUtilities::SymbolInstance

	#######################
	#  is_variable_name?  #
	#######################

	def is_variable_name?
    return to_s.is_variable_name?
	end

	###################
	#  variable_name  #
	###################

	def variable_name
	  return to_s.variable_name
	end
	
	###################
	#  accessor_name  #
	###################

	def accessor_name
	  return to_s.accessor_name
	end

	#########################
	#  write_accessor_name  #
	#########################

	def write_accessor_name
	  return to_s.write_accessor_name
	end

	##################
	#  swizzle_name  #
	##################

	def swizzle_name( swizzled_method_prefix = 'swizzled__', append_equals_to_method_name = false )
		return to_s.swizzle_name( swizzled_method_prefix, append_equals_to_method_name )
	end
	
end
