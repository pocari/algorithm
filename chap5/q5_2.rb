def read_int
  gets.chomp.to_i
end

# 完成したdpのテーブルから、ありえる組み合わせを全部返す
def patterns(dp, w, n, nums, acc = [])
  if n == 0
    p [:acc, acc.reverse] unless acc.empty?
    return
  end

  if dp[n - 1][w]
    # wはn番目の数字を使わない場合に生成可能
    patterns(dp, w, n - 1, nums, acc)
  end

  v = nums[n - 1]
  if dp[n - 1][w - v]
    # wはこの数字(v)を使う場合に生成可能
    patterns(dp, w - v, n - 1, nums, acc + [v])
  end
end

def main
  w = read_int
  n = read_int
  nums = n.times.map { read_int }

  p [:w, w]
  p [:n, n]
  p [:nums, nums]

  dp = Array.new(n + 1) do
    Array.new(w + 1, false)
  end

  # 部分和 0 は全部使わなければ可能なので、和が0の列は全部true(yes)にする
  0.upto(n) do |i|
    dp[i][0] = true
  end

  1.upto(n) do |i|
    1.upto(w) do |j|
      v = nums[i - 1]
      if v <= j
        # i個目の数字(nums[i-1])使う場合
        dp[i][j] = dp[i - 1][j - v]
        next if dp[i][j]
      end
      # i個目の数字を使わない場合
      dp[i][j] = dp[i - 1][j]
    end
  end

  puts dp.map {|r|  r.map { _1 ? '1' : '0'}.join(" ")}.join("\n")

  # n個の数字の部分わからwがつくれる？
  puts dp[n][w] ? 'Yes' : 'No'

  if dp[n][w]
    # 作れる場合に、そのwになる組み合わせを全部出力
    patterns(dp, w, n, nums)
  end
end

main