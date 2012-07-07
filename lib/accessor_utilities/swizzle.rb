
module ::AccessorUtilities::Swizzle

	####################
	#  swizzle_method  #
	####################

	def swizzle_method( method_name, swizzled_method_prefix = nil, append_equals_to_method_name = false, & method_definition )
		
		swizzling_method_name = ( append_equals_to_method_name ? method_name.write_accessor_name : method_name )
		
		swizzled_method_prefix = :swizzle__ unless swizzled_method_prefix

		# alias existing method
		swizzled_method_name = method_name.swizzle_name( swizzled_method_prefix, append_equals_to_method_name )
		alias_method( swizzled_method_name, swizzling_method_name )
		
		# declare new method in place of old
		define_method( ( append_equals_to_method_name ? method_name.write_accessor_name : method_name ), & method_definition )
		
		return swizzled_method_name
		
	end

	######################
	#  unswizzle_method  #
	######################

	def unswizzle_method( method_name, swizzled_method_prefix = nil, append_equals_to_method_name = false )
		
		swizzling_method_name = ( append_equals_to_method_name ? method_name.write_accessor_name : method_name )
		
		# if we have an aliased method, alias it back
		swizzle_name = method_name.swizzle_name( swizzled_method_prefix, append_equals_to_method_name )
		alias_method( swizzling_method_name, swizzle_name ) if method_defined?( swizzle_name )

		# remove swizzled method
		unswizzled_method = remove_method( swizzle_name )
		
		return unswizzled_method
		
	end
	
end
