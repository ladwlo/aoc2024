DIR = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]

MAS = 'MAS'.chars

def letters(input, r, c, dr, dc)
  3.times.map do
    r += dr
    c += dc
    next if r < 0 or r >= input.size or c < 0 or c >= input[0].size

    input[r][c]
  end
end

def solve(phase, fname)
  puts(phase)
  input = File.open(fname, 'r').readlines(chomp: true).map(&:chars)
  rows, cols = [input.size, input[0].size]
  count = 0
  rows.times do |r|
    cols.times do |c|
      next if input[r][c] != 'X'

      DIR.each do |dr, dc|
        count += 1 if letters(input, r, c, dr, dc) == MAS
      end
    end
  end
  puts("Part 1: #{count}")

  count = 0
  (1..(rows - 2)).each do |r|
    (1..(cols - 2)).each do |c|
      next if input[r][c] != 'A'

      if ((input[r - 1][c - 1] == 'M' and input[r + 1][c + 1] == 'S') or (input[r - 1][c - 1] == 'S' and input[r + 1][c + 1] == 'M')) and
        ((input[r - 1][c + 1] == 'M' and input[r + 1][c - 1] == 'S') or (input[r - 1][c + 1] == 'S' and input[r + 1][c - 1] == 'M'))
        count += 1
      end
    end
  end
  puts("Part 2: #{count}")
  puts
end

solve('TEST','test/d4.txt')
solve('INPUT', 'input/d4.txt')
