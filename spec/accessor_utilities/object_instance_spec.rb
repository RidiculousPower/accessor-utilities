# -*- encoding : utf-8 -*-

require_relative '../../lib/accessor_utilities.rb'

describe AccessorUtilities::ObjectInstance do
  
  #####################################
	#  instance_variables_as_accessors  #
	#####################################
	
	it 'can return a list of instance variables translated into corresponding accessor names' do
	  object_instance = Object.new
	  object_instance.instance_eval do
	    @some_variable = :value
	    @other_variable = :value
    end
    object_instance.instance_variables_as_accessors.should == [ :some_variable, :other_variable ]
  end
  
end
