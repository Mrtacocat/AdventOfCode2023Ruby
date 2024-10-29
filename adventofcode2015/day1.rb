# frozen_string_literal: true
file = File.read('adventofcode2015/input.txt')

floor_up = file.scan(/\(/)
floor_down = file.scan(/\)/)

sum = floor_up.count - floor_down.count

print sum
