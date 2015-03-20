# usefull methods from active_support gem

# Array
require 'active_support/core_ext/string'

# wrap
Array.wrap(foo: :bar) # => [{:foo=>:bar}]

# String
require 'active_support/core_ext/string'

# -> to camel case
"visual_effect".camelize(:upper) # => "visualEffect"
"visual_effect".camelize(:lower) # => "visualEffect"
# :upper is default

# -> to snake case
"AdminUser".underscore # => "admin_user"

# Hash
require 'active_support/core_ext/hash'

# -> deep merge
{a: {b: 1}}.deep_merge(a: {c: 2}) # => {:a=>{:b=>1, :c=>2}}

# -> keys to symbols
{nil => nil, 1 => 1, "nested" => {"a" => 3, 5 => 5}}.deep_symbolize_keys # => {nil=>nil, 1=>1, nested:{a:3, 5=>5}}

# -> keys to strings
{ person: { name: 'Rob', age: '28' } }.deep_stringify_keys # => {"person"=>{"name"=>"Rob", "age"=>"28"}}
