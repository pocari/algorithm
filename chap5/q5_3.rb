def read_int
  gets.chomp.to_i
end

def read_ints
  gets.chomp.split(/ /).map(&:to_i)
end

#この章末問題とAtCoderの問題が微妙に違うのでAtCoderの方の問題として解く
# https://atcoder.jp/contests/tdpc/tasks/tdpc_contest
def main
  n = read_int
  nums = read_ints

  # p [:n, n]
  # p [:nums, nums]

  # 全部つかったときの合計を最大wとして、そのwまでの数値を生成可能かをdpで解く
  # その後、各列について、一つでもtrueがあればその列の数値は生成可能
  w = nums.sum
  dp = Array.new(n + 1) do
    Array.new(w + 1, false)
  end

  # 部分和問題と同じなので、全部使わないパターン(0列目)は全部生成可能としてtrueに
  0.upto(n) do |i|
    dp[i][0] = true
  end

  1.upto(n) do |i|
    1.upto(w) do |j|
      v = nums[i - 1] # i番目の数字
      if v <= j
        dp[i][j] = dp[i - 1][j - v]
        next if dp[i][j]
      end
      dp[i][j] = dp[i - 1][j]
    end
  end

  # puts 0.upto(w).map {sprintf("%2d", _1)}.join(" ")
  # puts dp.map {|r|  r.map { _1 ? ' 1' : ' 0'}.join(" ")}.join("\n")

  # このdpのテーブルから列(縦)にみて、一つでもtrueがあれば生成可能
  count = 0
  0.upto(w) do |j|
    # 値 j が生成可能か調べて可能ならカウントする
    exists = false
    0.upto(n) do |i|
      exists = exists || dp[i][j]
    end
    count += 1 if exists
  end
  puts count
end

main