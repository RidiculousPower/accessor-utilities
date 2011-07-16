
module AccessorUtilities
	module AccessorMath
	end
	module Names
	end
	module Swizzle
	end
	module ObjectInstance
	end
	module StringInstance
	end
	module SymbolInstance
	end
end

require_relative 'accessor-utilities/AccessorUtilities.rb'
require_relative 'accessor-utilities/AccessorUtilities/AccessorMath.rb'
require_relative 'accessor-utilities/AccessorUtilities/ObjectInstance.rb'
require_relative 'accessor-utilities/AccessorUtilities/Swizzle.rb'
require_relative 'accessor-utilities/AccessorUtilities/StringInstance.rb'
require_relative 'accessor-utilities/AccessorUtilities/SymbolInstance.rb'

class Object
	include AccessorUtilities::ObjectInstance
end

class String
	include AccessorUtilities::StringInstance
end

class Symbol
	include AccessorUtilities::SymbolInstance
end
