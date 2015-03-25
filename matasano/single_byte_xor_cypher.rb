require "./XOR.rb"

def decrypt(cypher)
  options = {}
  cypher = hex_to_str(cypher)

  (0..255).each do |ch|
    option = ""
    cypher.each_byte do |byte|
      option << (byte ^ ch).chr
    end
    options[ch] = option
  end

  options.sort_by { |k,v| score(v)}.reverse.first
end

def score(str)
  sum = 0

  str.each_char do |ch|
    ch = ch.downcase
    if $frequencies[ch]
      sum += $frequencies[ch]
    else
      sum -= 10
    end
  end

  sum
end

def hex_to_str(hex)
  str = ""
  i = 0
  while i < hex.length
    str << hex[i..i + 1].to_i(16).chr
    i += 2
  end

  str
end

$frequencies = {
    " "=> 10,
    "a"=> 8.167,
    "b"=> 1.492,
    "c"=> 2.782,
    "d"=> 4.253,
    "e"=> 12.702,
    "f"=> 2.228,
    "g"=> 2.015,
    "h"=> 6.094,
    "i"=> 6.966,
    "j"=> 0.153,
    "k"=> 0.772,
    "l"=> 4.025,
    "m"=> 2.406,
    "n"=> 6.749,
    "o"=> 7.507,
    "p"=> 1.929,
    "q"=> 0.095,
    "r"=> 5.987,
    "s"=> 6.327,
    "t"=> 9.056,
    "u"=> 2.758,
    "v"=> 0.978,
    "w"=> 2.360,
    "x"=> 0.150,
    "y"=> 1.974,
    "z"=> 0.074
}
