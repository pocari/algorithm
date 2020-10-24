def read_int
  gets.chomp.to_i
end

def main
  w = read_int
  k = read_int
  n = read_int
  nums = n.times.map { read_int }
  inf = n + 1

  p [:w, w]
  p [:n, n]
  p [:nums, nums]

  # dp[i][j] が i個目までのnumsからいくつか選んで総和とってjになる場合に使った数字の最小個数
  # 例えば j=3 をつくるのに [1, 2] と [3] のパターンがあった場合に、より少ない[3] の1個という値がはいる

  # 考え方として、boolを値とするdpは無駄が多いらしく、その値自体により意味をもたせる
  # (今回だと、jを生成可能か？のboolだけじゃなく、jを生成可能だとしてそレに必要な数値の個数の最小値、までdpの値に意味をもたせることで可能)
  dp = Array.new(n + 1) do
    Array.new(w + 1, inf)
  end

  # 部分和 0 は全部使わなければ可能なので、和が0の列個数0を設定しておく
  0.upto(n) do |i|
    dp[i][0] = 0
  end

  1.upto(n) do |i|
    1.upto(w) do |j|
      v = nums[i - 1]
      if v <= j
        # i個目の数字(nums[i-1])使う場合
        dp[i][j] = [dp[i][j], dp[i - 1][j - v] + 1].min
      end
      # i個目の数字を使わない場合
      dp[i][j] = [dp[i][j], dp[i - 1][j]].min
    end
  end
  puts dp.map {|r|  r.map { _1 == inf ? ' -' : sprintf("%2d", _1) }.join(" ")}.join("\n")
  puts dp[n][w] <= k ? 'yes' : 'no'
end

main