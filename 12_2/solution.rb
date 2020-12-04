INPUT_FILE = "input.txt"

def get_limits(args)
  args[0].split('-')
end

def get_char(args)
  args[1].split(':').first
end

def get_char_array(args)
  args[2].split('')
end

def input_with_valid_counts
  num_valid_lines = 0

  File.readlines(INPUT_FILE).each do |line|
    args = line.split

    limits = get_limits(args)
    min = limits.first.to_i
    max = limits.last.to_i

    char = get_char(args)
    char_array = get_char_array(args)

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

def input_with_valid_positions
  num_valid_lines = 0

  File.readlines(INPUT_FILE).each do |line|
    args = line.split

    limits = get_limits(args)
    idx_1 = limits.first.to_i - 1
    idx_2 = limits.last.to_i - 1

    char = get_char(args)
    char_array = get_char_array(args)

    count = 0
    if char_array[idx_1] == char
      count += 1
    end
    if char_array[idx_2] == char
      count += 1
    end

    if count == 1
      num_valid_lines += 1
    end
  end

  num_valid_lines
end

puts "problem 1 solution: #{input_with_valid_counts}"
puts "problem 2 solution: #{input_with_valid_positions}"
