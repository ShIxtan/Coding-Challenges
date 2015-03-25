def hex_to_base64(str)
  num = str.to_i(16)
  str = ""
  until num == 0
    digit = int_to_base64(num % 64)
    str = digit + str
    num = num / 64
  end

  return str
end

def int_to_base64(int)
  if int < 26
    ("A".ord + int).chr
  elsif int < 52
    ("a".ord + (int - 26)).chr
  elsif int < 62
    (int - 52).to_s
  elsif int == 62
    "+"
  elsif int == 63
    "/"
  else
    false
  end
end
