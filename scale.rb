def scale(array, size)
  pairs = array.each_slice(2).map do |x, y|
    if x > size
      y *= size.to_f/x.to_f
      x = size
    end
    if y > size
      x *= size.to_f/y.to_f
      y = size
    end
    [x.to_i, y.to_i]
  end

  pairs.flatten
end
