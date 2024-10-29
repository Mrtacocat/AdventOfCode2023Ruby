WORD_TO_DIGIT = {
  'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5',
  'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}

def convert_digit_words_to_digit_number(str)
  str.gsub(/(one|two|three|four|five|six|seven|eight|nine)/i) do |match|
    WORD_TO_DIGIT[match.downcase]
  end

end

def extracted_digit_from_string(str)
  converted_str = convert_digit_words_to_digit_number(str)

  digits = converted_str.scan(/\d/)
  first_digit = digits.first
  last_digit  = digits.last

  if first_digit && last_digit
    (first_digit + last_digit).to_i
  else
    0
  end
end

sum = 0

File.foreach('adventofcode2023/day1/input.txt') do |line|
  sum += extracted_digit_from_string(line.strip)
end

puts "The total is #{sum}"
