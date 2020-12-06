INPUT_FILE = "input.txt"

def parse_map
  map = Array.new

  File.readlines(INPUT_FILE).each_with_index do |line, line_idx|
    # get char array
    squares = line.split("")
    # remove new lines
    squares = squares[0..-2]

    map << squares.to_ary
  end

  map
end

def num_trees_on_path(slope_x, slope_y)
  map = parse_map
  num_cols = map.first.length

  cur_x = 0
  cur_y = 0
  num_trees = 0

# while not out of range of the map
  while cur_y < map.length
    # determine if there's a tree at the current index
    # map repeats on the x-axis
    if map[cur_y][cur_x % num_cols] == "#"
      num_trees += 1
    end

    # move current position
    cur_x += slope_x
    cur_y += slope_y
  end

  num_trees
end

def multiple_slopes
  num_trees_slope_1 = num_trees_on_path(1, 1)
  num_trees_slope_2 = num_trees_on_path(3, 1)
  num_trees_slope_3 = num_trees_on_path(5, 1)
  num_trees_slope_4 = num_trees_on_path(7, 1)
  num_trees_slope_5 = num_trees_on_path(1, 2)

  num_trees_slope_1 * num_trees_slope_2 * num_trees_slope_3 * num_trees_slope_4 * num_trees_slope_5
end

puts "solution 1 is #{num_trees_on_path(3, 1)}"
puts "solution 2 is #{multiple_slopes}"
