# Maximum allowed cubes for each color
MAX_RED = 12
MAX_GREEN = 13
MAX_BLUE = 14

# Check if a game is possible based on the cube counts in each set
def game_possible?(sets)
  sets.each do |set|

    # Parse each color count (e.g., "3 blue")
    set.split(', ').each do |color_count|
      count, color = color_count.split
      count = count.to_i

      # Check if this set violates any color limit
      return false if (color == "red" && count > MAX_RED) ||
        (color == "green" && count > MAX_GREEN) ||
        (color == "blue" && count > MAX_BLUE)
    end
  end

  # If no violations, the game is possible
  true
end

# Read the input file and process games
possible_game_ids_sum = 0

File.foreach("adventofcode2023/day2/input.txt") do |line|
  if line =~ /Game (\d+): (.+)/
    game_id = $1.to_i
    sets = $2.split('; ')

    # Check if the game is possible and add its ID to the sum if so
    possible_game_ids_sum += game_id if game_possible?(sets)
  end
end

puts "Sum of possible game IDs: #{possible_game_ids_sum}"