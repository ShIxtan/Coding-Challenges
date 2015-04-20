def necklaces(current, odds, evens)
  if odds.empty? && evens.empty?
    return (current[-1] + current[0]).prime? ? 1 : 0
  end

  found = 0

  if current.last.even?
    odds.each_index do |i|
      if (current.last + odds[i]).prime?
        found += necklaces(current + [odds[i]], odds[0...i] + odds[(i + 1)..-1], evens)
      end
    end
  else
    evens.each_index do |i|
      if (current.last + evens[i]).prime?
        found += necklaces(current + [evens[i]], odds, evens[0...i] + evens[(i + 1)..-1])
      end
    end
  end

  return found
end

def num_necklaces(num)
  return 0 if num.odd?

  nums = (2..num).to_a
  evens = nums.select {|n| n.even?}
  odds = nums.select {|n| n.odd?}

  necklaces([1], odds, evens)
end

class Fixnum
  def prime?
    ('1' * self) !~ /^1?$|^(11+?)\1+$/
  end
end

File.open(ARGV[0]).each_line do |line|
  puts num_necklaces(line.to_i)
end

# 1234 1432
# 165234 143256
# 76125834 74123856 76583214 74385216
#
