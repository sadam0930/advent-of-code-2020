INPUT_FILE = "input.txt"
SLOPE_X = 3
SLOPE_Y = 1

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

def num_trees_on_path
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
    cur_x += SLOPE_X
    cur_y += SLOPE_Y
  end

  num_trees
end

puts "solution 1 is #{num_trees_on_path}"
