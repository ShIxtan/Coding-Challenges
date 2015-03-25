def hex_to_int(str)
  hex_codes = {"0"=> 0, "1"=> 1, "2"=> 2, "3"=> 3, "4"=> 4,
               "5"=> 5, "6"=> 6, "7"=> 7, "8"=> 8, "9"=> 9,
               "a"=> 10, "b"=> 11, "c"=> 12, "d"=> 13, "e"=> 14, "f"=> 15}
  num = 0

  str.downcase.each_char do |ch|
    num *= 16
    num += hex_codes[ch]
  end

  num
end

def hex_to_base64(str)
  num = hex_to_int(str)
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
