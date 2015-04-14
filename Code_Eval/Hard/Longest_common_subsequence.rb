def lcs(a, b)
  return [""] if a.length == 0
  results = []
  prev = lcs(a.chop, b)

  prev.each do |substring|
    temp = substring + a[a.length - 1]
    if in?(temp, b)
      results << temp
    end
  end

  prev + results
end

def in?(a, b)
  current = 0

  b.each_char do |ch|
    current += 1 if a[current] == ch
  end

  return current == a.length
end

File.open(ARGV[0]).each_line do |line|
  if line.include?(";")
    puts lcs(*(line.chomp.split(";"))).sort_by { |sub| sub.length }.last
  end
end
