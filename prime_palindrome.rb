def prime_palindrome(top = 1000)
  i = top
  while i > 0
    return i if is_prime_palindrome?(i)
    i -= 1
  end
end

def is_prime?(num)
  prim = (2..(num/2)).none? {|i| num % i == 0}
end

def is_prime_palindrome?(num)
  is_prime?(num) && is_palindrome?(num.to_s)
end

def is_palindrome?(str)
  (0..str.length/2).each do |i|
    return false unless str[i] == str[-1 * (i + 1)]
  end

  return true
end

puts prime_palindrome(1000)
