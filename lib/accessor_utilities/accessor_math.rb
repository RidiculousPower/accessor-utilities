
module ::AccessorUtilities::AccessorMath

  ##############################
  #  status_plus_other_status  #
  ##############################
  
  def status_plus_other_status( existing_status, other_status )
    
    status = nil
    
    case existing_status
      
      when :accessor

        status = :accessor

      when :reader

        case other_status
          when :writer, :accessor
            status = :accessor
          else
            status = :reader
        end

      when :writer

        case other_status
          when :reader, :accessor
            status = :accessor
          else
            status = :writer
        end
        
      when nil
        
        return other_status
      
    end
    
    return status
    
  end

  ###############################
  #  status_minus_other_status  #
  ###############################
  
  def status_minus_other_status( existing_status, other_status )
    
    status = nil
    
    case existing_status
      
      when :accessor

        case other_status
          when :accessor
            status = nil
          when :reader
            status = :writer
          when :writer
            status = :reader
          else
            status = :accessor
        end

      when :reader

        case other_status
          when :reader, :accessor
            status = nil
          else
            status = :reader
        end

      when :writer

        case other_status
          when :writer, :accessor
            status = nil
          else
            status = :writer
        end
      
    end
    
    return status
    
  end
	
end
