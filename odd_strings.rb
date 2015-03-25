# Enter your code here. Read input from STDIN. Print output to STDOUT

def is_odd?(str, m)
    str.each_char do |ch|
        return 0 if ch.ord % 2 == 0
    end

    return 1
end

gets.chomp.to_i.times do
    m, k = gets.chomp.split.map(&:to_i)
    sum = 0
    gets.chomp.split.each do |str|
        sum += is_odd?(str, m)
    end

    puts (sum % 2 == 1) ? "ODD" : "EVEN"
end
