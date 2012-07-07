
require_relative '../../lib/accessor_utilities.rb'

describe AccessorUtilities::AccessorMath do

  ##############################
  #  status_plus_other_status  #
  ##############################

  it 'can add one status to another' do
    
    class AccessorUtilities::AccessorMath::Mock
      
      extend AccessorUtilities::AccessorMath
      
      status_plus_other_status( nil, :accessor ).should == :accessor
      status_plus_other_status( nil, :reader ).should == :reader
      status_plus_other_status( nil, :writer ).should == :writer

      status_plus_other_status( :accessor, :accessor ).should == :accessor
      status_plus_other_status( :accessor, :reader ).should == :accessor
      status_plus_other_status( :accessor, :writer ).should == :accessor

      status_plus_other_status( :reader, :accessor ).should == :accessor
      status_plus_other_status( :reader, :reader ).should == :reader
      status_plus_other_status( :reader, :writer ).should == :accessor

      status_plus_other_status( :writer, :accessor ).should == :accessor
      status_plus_other_status( :writer, :reader ).should == :accessor
      status_plus_other_status( :writer, :writer ).should == :writer

    end
    
  end

  ###############################
  #  status_minus_other_status  #
  ###############################
  
  it 'can subtract one status from another' do

    class AccessorUtilities::AccessorMath::Mock

      status_minus_other_status( nil, :accessor ).should == nil
      status_minus_other_status( nil, :reader ).should == nil
      status_minus_other_status( nil, :writer ).should == nil

      status_minus_other_status( :accessor, :accessor ).should == nil
      status_minus_other_status( :accessor, :reader ).should == :writer
      status_minus_other_status( :accessor, :writer ).should == :reader

      status_minus_other_status( :reader, :accessor ).should == nil
      status_minus_other_status( :reader, :reader ).should == nil
      status_minus_other_status( :reader, :writer ).should == :reader

      status_minus_other_status( :writer, :accessor ).should == nil
      status_minus_other_status( :writer, :reader ).should == :writer
      status_minus_other_status( :writer, :writer ).should == nil
    
    end
    
  end
  
end
