WIN_CONDITIONS = {
  "Rock" => "Scissors",
  "Paper" => "Rock",
  "Scissors" => "Paper"
}

SHAPE_SCORES = {
  "Rock" => 1,
  "Paper" => 2,
  "Scissors" => 3
}

LOST_SCORE = 0
DRAW_SCORE = 3
WIN_SCORE = 6

def determine_shape(code)
  case code
  when "A", "X"
    return "Rock"
  when "B", "Y"
    return "Paper"
  when "C", "Z"
    return "Scissors"
  else
    raise "Unexpected code #{code}"
  end
end

def determine_round_score(o_shape, m_shape)
  if WIN_CONDITIONS[o_shape] == m_shape
    return SHAPE_SCORES[m_shape] + LOST_SCORE
  elsif o_shape == m_shape
    return SHAPE_SCORES[m_shape] + DRAW_SCORE
  else
    return SHAPE_SCORES[m_shape] + WIN_SCORE
  end
end

def solve_part_one(file)
  scores = File.readlines(file).map do |line|
    opponent, me = line.split(" ")
    o_shape = determine_shape(opponent)
    m_shape = determine_shape(me)

    determine_round_score(o_shape, m_shape)
  end

  scores.sum
end

def solve_part_two(file)
  scores = File.readlines(file).map do |line|
    opponent, me = line.split(" ")
    o_shape = determine_shape(opponent)
    m_shape = determine_my_shape_to_force_outcome(o_shape, me)

    determine_round_score(o_shape, m_shape)
  end

  scores.sum
end

def determine_my_shape_to_force_outcome(opponent_shape, outcome)
  case outcome
  when "Y" # Draw
    return opponent_shape
  when "X" # Chose shape to make opponent win
    return WIN_CONDITIONS[opponent_shape]
  when "Z" # Chose shape to make oponent lose
    return WIN_CONDITIONS.invert()[opponent_shape]
  end
end

if __FILE__ == $0
  day = File.dirname(__FILE__)
  puts "Part 1: #{solve_part_one("#{day}/input.txt")}" # 12740
  puts "Part 2: #{solve_part_two("#{day}/input.txt")}" # 11980
end
