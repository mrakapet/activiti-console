

s = 'FooBarBz'

puts s
puts s.gsub(/(.)([A-Z])/, '\1_\2').downcase

puts Array('hello').to_s
puts Array(['hello', 'buy']).to_s
