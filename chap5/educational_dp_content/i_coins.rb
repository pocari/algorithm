def read_int
  gets.chomp.to_i
end

def read_floats
  gets.chomp.split.map(&:to_f)
end

def main
  n = read_int
  ps = read_floats

  heads = n / 2 + 1

  # p [:n, n]
  # p [:heads, heads]
  # p [:ps, ps]

  dp = Array.new(n + 1) do
    Array.new(n + 1, 0)
  end

  dp[0][0] = 1
  1.upto(n) do |i|
    head_p = ps[i - 1] # i番目のコインの表の確率
    tail_p = 1 - head_p # i番目のコインの裏の確率
    0.upto(n) do |j|
      # i - 1 番目までのコインを使って, jこの表がすでにあったら、このj番目のコインは裏
      dp[i][j] = dp[i - 1][j] * tail_p
      if j > 0
        # i-1番目までのコインを使って、 j - 1個の表があったときは、このj番目のコインが表なら表はj個
        dp[i][j] += dp[i - 1][j - 1] * head_p
      end
    end
  end

  # p [:targets, dp[n][heads .. - 1]]
  p dp[n][heads ..-1].sum

  # puts dp.map {|row| row.map { sprintf("%2.2f", _1) }.join(" ") }.join("\n")
end

main