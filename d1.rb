def solve(phase, fname)
  puts(phase)
  l = []
  r = []
  File.open(fname, 'r').readlines.map(&:split).each do |a, b|
    l.append(a.to_i)
    r.append(b.to_i)
  end
  l.sort!
  r.sort!
  score1 = l.zip(r).map { |a, b| (a - b).abs }.reduce(0, &:+)
  puts("Part 1: #{score1}")
  counts = r.group_by(&:itself).transform_values(&:size)
  score2 = l.map { |x| x * counts.fetch(x, 0) }.reduce(&:+)
  puts("Part 2: #{score2}")
  puts
end

solve('TEST','test/d1.txt')
solve('INPUT', 'input/d1.txt')
