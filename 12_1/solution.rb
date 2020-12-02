require "set"

TARGET = 2020
INPUT_FILE = "input.txt"

def two_sum
  compliments = Set.new

  input_array.each do |num|
    compliment = TARGET - num
    if compliments.include?(compliment)
      puts num * compliment
      break
    else
      compliments.add(num)
    end
  end
end

def three_sum
  input_array.each_with_index do |num, idx|
    compliment_target = TARGET - num

    sub_compliments = Set.new
    input_array[idx+1, input_array.length].each do |sub|
      sub_compliment = compliment_target - sub
      if sub_compliments.include?(sub_compliment)
        puts num * sub * sub_compliment
        return
      else
        sub_compliments.add(sub)
      end
    end
  end
end

def input_array
  nums = []
  File.readlines(INPUT_FILE).each do |line|
    nums << line.to_i
  end
  nums
end

puts "solution 1: #{two_sum}"
puts "solution 1: #{three_sum}"
