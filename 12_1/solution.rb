require 'set'

TARGET = 2020

input = "input.txt"
compliments = Set.new

File.readlines(input).each do |line|
  num = line.to_i
  compliment = TARGET - num
  if compliments.include?(compliment)
    puts num * compliment
    break
  else
    compliments.add(num)
  end
end
