# frozen_string_literal: true
require 'set'

class Day3Part1
  def self.part_one(lines)
    engine = generate_engine(lines)
    engine.each_with_index.reduce(0) do |acc, (row, idx)|
      row.each_with_index do |item, idy|
        next if item.scan(/(?:\d|\.)/).first

        neighbours = find_neighbours(engine, idx, idy)
        acc += neighbours.sum
      end
      acc
    end
  end

  def self.part_two(lines)
    engine = generate_engine(lines)
    engine.each_with_index.reduce(0) do |acc, (row, idx)|
      row.each_with_index do |item, idy|
        next if item.scan(/(?:\d|\.)/).first

        neighbours = find_neighbours(engine, idx, idy)
        acc += neighbours.reduce(&:*) if neighbours.size == 2
      end
      acc
    end
  end

  class << self
    def generate_engine(lines)
      lines.each_with_object([]) do |line, matrix|
        numbers = line.scan(/(?:\d+|.)/)
        matrix << numbers.each_with_object([]) do |number, row|
          number.length.times { |_| row << number }
          row
        end
        matrix
      end
    end

    def find_neighbours(engine, idx, idy)
      positions = [0, 1, -1].freeze
      neighbours = positions.each_with_object([]) do |x, acc|
        positions.each do |y|
          next if x == 0 && y == 0
          ni, nj = idx + x, idy + y

          if ni.between?(0, engine.size - 1) && nj.between?(0, engine[ni].size - 1)
            acc << engine[ni][nj].to_i
          end
        end
      end
      Set.new(neighbours).reject(&:zero?)
    end
  end
end

lines = File.readlines('adventofcode2023/day3/input.txt').map(&:chomp)

result_part_one = Day3Part1.part_one(lines)
puts "Total sum for Part One: #{result_part_one}"

result_part_two = Day3Part1.part_two(lines)
puts "Total sum for Part Two: #{result_part_two}"