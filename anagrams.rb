require "set"

def get_anagrams(filename, word)
  words = Set.new(File.readlines(filename).map{|word| word.chomp.downcase})
  subs = Set.new(subwords(word).select {|subword| words.include?(subword) && subword.length > 1})
  word = get_counts(word.downcase)

  results = anagrams(subs, word).sort_by{|a| a.length}
  results.delete(word)

  longest = results.last
  two = results.find{|arr| arr.length == 2}

  puts longest.join(" ") if longest
  puts two.join(" ") if two
end

def get_counts(word)
  counts = Hash.new(0)

  word.each_char do |ch|
    counts[ch] += 1
  end

  counts
end

def subwords(word)
  subs = subsets(word.split(""))
  subs.map { |subword| subword.join("")}
end

def subsets(array)
  subs = []
  (0..array.length).each do |i|
    subs += array.permutation(i).to_a
  end
  subs
end

def anagrams(subs, word)

  results = []

  subs.each do |sub|
    temp_word = subtract(word, sub)
    if temp_word
      if done?(temp_word)
        results << [sub]
      else
        temp = anagrams(subs, temp_word)
        results += temp.map { |anagram| [sub] + anagram }
      end
    end
  end

  return results
end

def subtract(word, sub)
  w = word.dup

  sub.each_char do |ch|
    return nil if w[ch] <= 0
    w[ch] -= 1
  end

  w
end

def done?(word)
  word.all? {|k, v| v == 0}
end

if __FILE__ == $PROGRAM_NAME
  puts get_anagrams("words.txt", ARGV[0])
end
