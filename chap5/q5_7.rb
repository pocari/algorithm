def main
  s = gets.chomp
  t = gets.chomp

  # p [:s, s]
  # p [:t, t]

  dp = Array.new(s.size + 1) do
    Array.new(t.size + 1, 0)
  end

  1.upto(s.size) do |i|
    1.upto(t.size) do |j|
      if s[i - 1] == t[j - 1]
        dp[i][j] = dp[i - 1][j - 1] + 1
      else
        if dp[i - 1][j] < dp[i][j - 1]
          dp[i][j] = dp[i][j - 1]
        else
          dp[i][j] = dp[i - 1][j]
        end
      end
    end
  end

  # puts dp[s.size][t.size]
  # puts dp.map { |r| r.map { sprintf("%2d", _1) }.join(" ") }.join("\n")
  puts pattern(dp, s, t)
end

def pattern(dp, s, t)
  i = s.size
  j = t.size
  size = dp[i][j]

  return "" if size == 0

  buf = Array.new(size)
  while (size > 0)
    if s[i - 1] == t[j - 1]
      buf[size - 1] = s[i - 1]
      size -= 1
      i -= 1
      j -= 1
    elsif dp[i - 1][j] < dp[i][j - 1]
      j -= 1
    else
      i -= 1
    end
  end
  buf.join
end

main