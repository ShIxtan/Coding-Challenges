Two ruby scripts are included. Ruby must be installed in order to run. [Instructions for installing Ruby](https://www.ruby-lang.org/en/documentation/installation/)

### Anagrams

Takes a word and a dictionary (defaults to words.txt). Output is the anagram that uses the most words from the dictionary, then an anagram that uses two words. Ignores one-letter words.

to run, in the console:

`ruby anagrams.rb my_word_here`

if you want to use a different dictionary:

`ruby anagrams.rb my_word_here dictionary_filename`


### Tail

prints the last 10 lines of each given file. To run:

`ruby tail.rb filename another_filename`

Options:

|                   Option | Description                          |
|-------------------------:|--------------------------------------|
| -n K, --lines K          | Outputs the last K lines             |
| -c K, --bytes K          | Outputs the last K bytes             |
| -q, --quiet, --silent    | Don't print file header              |
| -v, --verbose            | Print file header                    |
| -f, --follow             | Output extra lines as the file grows |
| -s N, --sleep-interval N | Seconds to sleep between iterations  |
