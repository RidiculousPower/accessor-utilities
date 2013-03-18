# -*- encoding : utf-8 -*-

module ::AccessorUtilities::StringInstance

	#######################
	#  is_variable_name?  #
	#######################

	def is_variable_name?
    return self[ 0 ] == '@'
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

	##############
	#  accessor  #
	##############
	
	alias_method :accessor, :accessor_name

	#########################
	#  write_accessor_name  #
	#########################

	def write_accessor_name

	  case self[ -1 ]
	    
      when '?'
        return_value = self.dup
        return_value[ -1 ] = '='
      when '='
        return_value = to_sym
      else
        return_value = ( self + '=' ).to_sym

    end

	  return return_value

	end

	####################
	#  write_accessor  #
	####################
	
	alias_method :write_accessor, :write_accessor_name

	##################
	#  swizzle_name  #
	##################

	def swizzle_name( swizzled_method_prefix = 'swizzled__', append_equals_to_method_name = false )

		swizzled_method_name = ( swizzled_method_prefix.to_s + to_s )
		swizzled_method_name = swizzled_method_name.write_accessor_name if append_equals_to_method_name

	  return swizzled_method_name.to_sym

	end

end
