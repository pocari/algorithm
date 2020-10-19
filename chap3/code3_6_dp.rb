def read_int
  gets.chomp.to_i
end

def dump_board(dp, a)

  print "        "
  puts 0.upto(dp[0].size - 1).map {|j| sprintf("%2d", j)}.join(" ")
  0.upto(dp.size - 1) do |i|
    print(sprintf("%2d (%2d)", *(i == 0 ? [0, 0] : [i, a[i - 1]])))
    0.upto(dp[i].size - 1) do |j|
      print(sprintf(" %2d", dp[i][j] ? 1 : 0))
    end
    puts
  end
  puts
end

def solve(n, w, a)
  dp = Array.new(n + 1) do
    Array.new(w + 1, false)
  end
  0.upto(n) do |i|
    dp[i][0] = true
  end

  1.upto(n) do |i|
    1.upto(w) do |j|
      val = a[i - 1]
      if dp[i - 1][j - val]
        dp[i][j] = true
      end
      if dp[i - 1][j]
        dp[i][j] = true
      end
    end
  end

  dump_board(dp, a)
  dp[n][w]
end

def main
  n = read_int
  w = read_int
  a = n.times.map { read_int }

  puts <<~EOS
  dump_inputs
  N: #{n}
  W: #{w}
  array: #{a.join(", ")}
  EOS

  exists = false
  exists = solve(n, w, a)

  if exists
    puts "Yes"
    p [:picked, exists]
  else
    puts "No"
  end
end

main