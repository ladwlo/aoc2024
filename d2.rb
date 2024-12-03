def safe?(levels)
  diffs = levels[1..].zip(levels[..-1]).map { |a, b| a - b }
  diffs.map(&:abs).all? { |x| x >= 1 && x <= 3 } && diffs.map(&:positive?).uniq.size == 1
end

def solve(phase, fname)
  puts(phase)
  safe_count_part1 = safe_count_part2 = 0
  File.open(fname, 'r').readlines.map(&:split).map { |arr| arr.map(&:to_i) }.each do |levels|
    if safe?(levels)
      safe_count_part1 += 1
      safe_count_part2 += 1
    elsif (0..(levels.size - 1)).any? { |n| safe?(levels.slice(0, n) + levels.slice(n + 1, levels.size)) }
      safe_count_part2 += 1
    end
  end
  puts("Part 1: #{safe_count_part1}")
  puts("Part 2: #{safe_count_part2}")
end

solve('TEST','test/d2.txt')
solve('INPUT', 'input/d2.txt')
