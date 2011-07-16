require 'date'

Gem::Specification.new do |spec|

  spec.name                      =  'accessor-utilities'
  spec.rubyforge_project         =  'accessor-utilities'
  spec.version                   =  '1.0.0'

  spec.summary                   =  "Utility methods for accessor-related meta-programming."
  spec.description               =  "Extends String and Symbol instances with variable/accessor methods, provides swizzling helpers, provides accessor-related math for transforming :accessor, :reader, :writer."

  spec.authors                   =  [ 'Asher' ]
  spec.email                     =  'asher@ridiculouspower.com'
  spec.homepage                  =  'http://rubygems.org/gems/accessor-utilities'

  spec.date                      =  Date.today.to_s
  
  # ensure the gem is built out of versioned files
  # also make sure we include the bundle since we exclude it from git storage
  spec.files                     = Dir[ '{lib,spec}/**/*',
                                        'README*', 
                                        'LICENSE*' ] & `git ls-files -z`.split("\0")

end
