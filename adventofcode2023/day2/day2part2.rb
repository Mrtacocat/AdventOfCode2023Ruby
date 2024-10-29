# frozen_string_literal: true
def minimum_cubes_needed(sets)
  min_red = 0
  min_green = 0
  min_blue = 0

  sets.each do |set|
    red_count = 0
    green_count = 0
    blue_count = 0

    set.split(', ').each do |color_count|
      count, color = color_count.split
      count = count.to_i

      case color
      when 'red'
        red_count = count
      when 'green'
        green_count = count
      when 'blue'
        blue_count = count
      end
    end

    min_red = [min_red, red_count].max
    min_green = [min_green, green_count].max
    min_blue = [min_blue, blue_count].max
  end

  [min_red, min_green, min_blue]
end

total_power_sum = 0

File.foreach("adventofcode2023/day2/test.txt") do |line|
  if line =~ /Game (\d+): (.+)/
    sets = $2.split("; ")

    min_red, min_green, min_blue = minimum_cubes_needed(sets)

    power = min_red * min_green * min_blue

    total_power_sum += power
  end
end

puts "Sum of the power of minimum sets #{total_power_sum}"
