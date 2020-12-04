INPUT_FILE = "input.txt"

def count_valid_pws
  num_valid_lines = 0

  File.readlines(INPUT_FILE).each do |line|
    args = line.split

    limits = args[0].split('-')
    min = limits.first.to_i
    max = limits.last.to_i

    char = args[1].split(':').first
    char_array = args[2].split('')

    count = 0
    char_array.each do |cur_char|
      if cur_char == char
        count += 1
      end
    end

    if count >= min && count <= max
      num_valid_lines += 1
    end
  end

  num_valid_lines
end

puts "problem 1 solution: #{count_valid_pws}"
