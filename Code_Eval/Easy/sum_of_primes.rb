def sum_primes(top = 1000)
  sum = 0
  i = 0
  count = 0

  until count == top
    if is_prime?(i)
      sum += i
      count += 1
    end

    i += 1
  end

  sum
end

def is_prime?(num)
  return false if num < 2
  prim = (2..(num/2)).none? {|i| num % i == 0}
end

puts sum_primes(1000)
