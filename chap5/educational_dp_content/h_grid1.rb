MOD_BASE = 10 ** 9 + 7

def read_ints
  gets.chomp.split.map(&:to_i)
end

def dump_grid(grid, margin = 3)
  grid.map { |row|
    row.map {
      if _1 == -1
        (' ' * margin - 1) + '#'
      else
        sprintf("%*s", margin, _1)
      end
    }.join(" ")
  }.join("\n")
end

def main
  hh, ww = read_ints

  grid = hh.times.map { gets.chomp.chars.map { _1 == '.' ? 0 : -1 } }

  grid[0][0] = 1
  0.upto(hh - 1) do |h|
    0.upto(ww - 1) do |w|
      next if h == 0 && w == 0
      next if grid[h][w] == -1
      up   = (h - 1 >= 0) && (grid[h - 1][w] != -1) ? grid[h - 1][w] : 0
      left = (w - 1 >= 0) && (grid[h][w - 1] != -1) ? grid[h][w - 1] : 0
      grid[h][w] = up + left
    end
  end
  puts grid[hh - 1][ww - 1] % MOD_BASE
  # puts dump_grid(grid)
end

main