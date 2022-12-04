def solve_part_one(file)
  return parse_file_and_determine_calories_per_elf(file)
    .max(1)
    .sum
end

def solve_part_two(file)
  return parse_file_and_determine_calories_per_elf(file)
    .max(3)
    .sum
end

def parse_file_and_determine_calories_per_elf(file)
  elves = []
  calories = 0

  File.readlines(file).each do |line|
    if line.chomp.empty?
      elves.append(calories)
      calories = 0
    else
      calories += line.to_i
    end
  end

  return elves
end

if __FILE__ == $0
  puts "Part 1: #{solve_part_one("day01/input.txt")}" # 72070
  puts "Part 2: #{solve_part_two("day01/input.txt")}" # 211805
end
