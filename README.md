# Accessor Utilities #

http://rubygems.org/gems/accessor-utilities

# Description #

Utility methods for accessor-related meta-programming.

# Summary #

Extends String and Symbol instances with variable/accessor methods, provides swizzling helpers, provides accessor-related math for transforming :accessor, :reader, :writer.

## AccessorUtilities::AccessorMath ##

Given attribute accessor types :accessor, :reader, :writer:

### :status_plus_other_status ###

* status_plus_other_status( :accessor, :reader ) = :accessor
* status_plus_other_status( :accessor, :writer ) = :accessor
* status_plus_other_status( :reader, :writer ) = :accessor
* status_plus_other_status( :reader, :reader ) = :reader

### :status_minus_other_status ###

* status_minus_other_status( :accessor, :reader ) = :writer
* status_minus_other_status( :accessor, :writer ) = :reader
* status_minus_other_status( :reader, :writer ) = :reader
* status_minus_other_status( :reader, :reader ) = nil

## AccessorUtilities::Swizzle ##

Given a class with a method defined:

```ruby
class ExampleClass

  def some_method
    return :first_value
  end

end
```

Swizzle methods within the present context:

```ruby
class ExampleClass

  include AccessorUtilities::Swizzle

  swizzle_method( :some_method ) do
    :second_value
  end

end
```

Result is method call invokes block used to swizzle method:

```ruby
class ExampleClass

  self.some_method
  # => :second_value

end
```

## AccessorUtilities::StringInstance and AccessorUtilities::SymbolInstance ##

* is_variable_name?
* variable_name
* accessor_name
* write_accessor_name
* swizzle_name

# Install #

* sudo gem install accessor-utilities

# License #

  (The MIT License)

  Copyright (c) 2011 Asher

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  'Software'), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.