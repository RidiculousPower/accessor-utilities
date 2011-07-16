
module AccessorUtilities::StringInstance

	#######################
	#  is_variable_name?  #
	#######################

	def is_variable_name?
    return self[ 0 ] == '@'
	end

	#########################
	#  write_accessor_name  #
	#########################

	def write_accessor_name
	  return ( self[ length - 1 ] == '=' ? to_sym : ( self + '=' ).to_sym )
	end

	###################
	#  variable_name  #
	###################

	def variable_name
	  return ( is_variable_name? ? to_sym : ( '@' + self ).to_sym )
	end
	
	###################
	#  accessor_name  #
	###################

	def accessor_name
	  return ( is_variable_name? ? self.slice( 1, length ).to_sym : to_sym )
	end

	##################
	#  swizzle_name  #
	##################

	def swizzle_name( swizzled_method_prefix, append_equals_to_method_name = false )

		swizzled_method_name = ( swizzled_method_prefix.to_s + to_s )
		swizzled_method_name = swizzled_method_name.write_accessor_name if append_equals_to_method_name

	  return swizzled_method_name

	end

end
