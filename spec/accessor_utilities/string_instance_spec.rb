# -*- encoding : utf-8 -*-

require_relative '../../lib/accessor_utilities.rb'

describe AccessorUtilities::StringInstance do
	
	#######################
	#  is_variable_name?  #
	#######################

	it 'can report if a string is a variable name' do
		'@variable'.is_variable_name?.should == true
		'not_variable'.is_variable_name?.should == false
	end

	###################
	#  variable_name  #
	###################

	it 'can return variable name for variable or accessor name' do
		'@variable'.variable_name.should == :@variable
		'not_variable'.variable_name.should == :@not_variable
	end
	
	###################
	#  accessor_name  #
	###################

	it 'can return accessor name for variable or accessor name' do
		'@variable'.accessor_name.should == :variable
		'not_variable'.accessor_name.should == :not_variable
	end
	
	#########################
	#  write_accessor_name  #
	#########################

	it 'can return write accessor name for accessor name' do
		'accessor_name'.write_accessor_name.should == :accessor_name=
	end

	##################
	#  swizzle_name  #
	##################

  it 'can return a swizzle name given a prefix for an accessor name' do
    'accessor_name'.swizzle_name.should == :swizzled__accessor_name
    'accessor_name'.swizzle_name( :swizzle_prefix__, false ).should == :swizzle_prefix__accessor_name
    'accessor_name'.swizzle_name( :swizzle_prefix__, true ).should == :swizzle_prefix__accessor_name=
  end
  
end
