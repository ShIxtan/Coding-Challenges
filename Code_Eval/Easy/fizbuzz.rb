def fizbuzz(file)
  file.readlines.each do |line|
    x, y, n = line.split(" ").map(&:to_i)

    (1..n).each do |i|
      print "F" if i % x == 0
      print "B" if i % y == 0
      print i unless (i % x == 0) || (i % y == 0)
      print " "
    end

    puts
  end
end
