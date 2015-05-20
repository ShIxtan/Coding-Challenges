def singular_subwords(filename, length)
  dictionary = read_file(filename)
  subwords = all_subwords(dictionary, length)

  subwords.select! { |subword, words| words.length == 1 }

  output_files(subwords)
end

def all_subwords(dictionary, length)
  subwords = Hash.new { |h, k| h[k] = []  }

  dictionary.each do |word|
    (0..(word.length - length)).each do |i|
      subword = word[i...(i + length)]
      subwords[subword] << word if subword.length == length
    end
  end

  subwords
end

def read_file(filename)
  File.readlines(filename).map(&:chomp)
end

def output_files(subwords)
  sequences = File.open("sequences", "w")
  words = File.open("words", "w")

  subwords.each do |sequence, word|
    sequences.puts sequence
    words.puts word
  end

  sequences.close
  words.close
end

singular_subwords("./dictionary.txt", 4)
