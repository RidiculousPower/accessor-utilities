
# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

class ::Object
	include ::AccessorUtilities::ObjectInstance
end

class ::String
	include ::AccessorUtilities::StringInstance
end

class ::Symbol
	include ::AccessorUtilities::SymbolInstance
end
