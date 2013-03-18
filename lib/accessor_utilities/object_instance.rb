# -*- encoding : utf-8 -*-

module ::AccessorUtilities::ObjectInstance

	#####################################
	#  instance_variables_as_accessors  #
	#####################################

	def instance_variables_as_accessors

	  return instance_variables.collect { |this_var| this_var.accessor_name }

	end

end
