require "./hex_to_base.rb"

def hexor(first, second)
  first = hex_to_int(first)
  second = hex_to_int(second)

  (first ^ second).to_s(16)
end
