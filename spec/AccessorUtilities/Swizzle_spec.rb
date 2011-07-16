
require_relative '../../lib/accessor-utilities.rb'

describe AccessorUtilities::Swizzle do

  ######################
  #  swizzle_method    #
  #  unswizzle_method  #
  ######################
  
  it 'can swizzle and unswizzle a method with a new method' do
    class AccessorUtilities::Swizzle::Mock
      def method_to_swizzle
        return @return_value ||= :first_value
      end
      def method_to_swizzle=( value )
        @return_value = value
      end
    end
    object_instance = AccessorUtilities::Swizzle::Mock.new
    object_instance.method_to_swizzle.should == :first_value
    object_instance.method_to_swizzle = :value
    object_instance.method_to_swizzle.should == :value
    class AccessorUtilities::Swizzle::Mock
      extend AccessorUtilities::Swizzle
      swizzle_method( :method_to_swizzle, :swizzle_prefix__, false ) do
        :second_value
      end
      swizzle_method( :method_to_swizzle, :swizzle_prefix__, true ) do |value|
        :second_value=
      end
    end
    object_instance.method_to_swizzle.should == :second_value
    object_instance.method_to_swizzle = :value
    object_instance.method_to_swizzle.should == :second_value
    object_instance.swizzle_prefix__method_to_swizzle.should == :value
    object_instance.swizzle_prefix__method_to_swizzle.should == :value
    object_instance.method_to_swizzle.should == :second_value
    class AccessorUtilities::Swizzle::Mock
      unswizzle_method( :method_to_swizzle, :swizzle_prefix__, false )
      unswizzle_method( :method_to_swizzle, :swizzle_prefix__, true )
    end
    object_instance.method_to_swizzle.should == :value
    object_instance.method_to_swizzle = :first_value
    object_instance.method_to_swizzle.should == :first_value
    AccessorUtilities::Swizzle::Mock.method_defined?( :swizzle_prefix__method_to_swizzle ).should == false
    AccessorUtilities::Swizzle::Mock.method_defined?( :swizzle_prefix__method_to_swizzle= ).should == false
  end
  
end
