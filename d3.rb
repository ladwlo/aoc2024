NUMBER = /\d+/
PATTERN_1 = /mul\(\d\d?\d?,\d\d?\d?\)/
PATTERN_2 = /mul\(\d\d?\d?,\d\d?\d?\)|do\(\)|don't\(\)/

def solve(phase, fname)
  puts(phase)
  input = File.open(fname, 'r').readlines.join
  multiplications = input.scan(PATTERN_1)
  res1 = multiplications
           .map { |s| s.scan(NUMBER) }
           .map { |a, b| a.to_i * b.to_i }
           .reduce(0, &:+)
  puts("Part 1: #{res1}")

  instructions = input.scan(PATTERN_2)
  res2 = 0
  enabled = true
  instructions.each do |instruction|
    case instruction
    when 'do()'
      enabled = true
    when 'don\'t()'
      enabled = false
    else
      res2 += instruction.scan(NUMBER).map(&:to_i).reduce(1, &:*) if enabled
    end
  end
  puts("Part 2: #{res2}")
  puts
end

solve('TEST 1','test/d3p1.txt')
solve('TEST 2','test/d3p2.txt')
solve('INPUT', 'input/d3.txt')
