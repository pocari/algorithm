def read_int
  gets.chomp.to_i
end

def main
  n = read_int
  h = n.times.map { read_int }
  inf = h.max + 1

  # p [:n, n, :h, h]
  dp = Array.new(n, inf)
  dp[0] = 0

  1.upto(n - 1) do |i|
    dp[i] = dp[i - 1] + (h[i] - h[i - 1]).abs
    if i - 2 >= 0
      i2 = dp[i - 2] + (h[i] - h[i - 2]).abs
      if i2 < dp[i]
        dp[i] = i2
      end
    end
  end

  p [:dp, dp]
  p dp[n-1]
end

main