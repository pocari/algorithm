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

  (0 ... n - 1).each do |i|
    val1 = dp[i] + (h[i + 1] - h[i]).abs
    if val1 < dp[i + 1]
      dp[i + 1] = val1
    end

    if i + 2 < n
      val2 = dp[i] + (h[i + 2] - h[i]).abs
      if val2 < dp[i + 2]
        dp[i + 2] = val2
      end
    end
  end

  p [:dp, dp]
  p dp[n - 1]
end

main