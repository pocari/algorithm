INF = Float::MAX
def read_ints
  gets.chomp.split(/ /).map(&:to_i)
end

def choice(dp, v, w, i, j, acc = [])
  if i == 0
    acc.reverse
  else
    if dp[i][j] == dp[i - 1][j]
      # i番目の商品は使ってない
      choice(dp, v, w, i - 1, j, acc)
    else
      # i番目の商品を使った(indexはi-1)
      choice(dp, v, w, i - 1, j - w[i - 1], acc + [i - 1])
    end
  end
end

def main
  n, total_w = read_ints
  w, v = n.times.map { read_ints }.transpose

  # p [:n, n]
  # p [:total_w, total_w]
  # p [:w, w]
  # p [:v, v]

  # 行はD問題と同じで商品数にするが、列は重さではなく価値にする(wが10**9ぐらいまでありテーブルをつくれない)
  # 最大の価値は商品数最大(=100)でそれぞれが最大の価値(1000なので) 100 * 1000 = 100000にする
  value_max = 100000
  dp = Array.new(n + 1) do
    Array.new(value_max + 1, INF)
  end

  # 価値0のときの最小の重さは0なので初期化できるところはする
  0.upto(n) do |i|
    dp[i][0] = 0
  end

  1.upto(n) do |i|
    # 今から試す商品の重さ(ww)と価値(vv)
    ww = w[i - 1]
    vv = v[i - 1]
    1.upto(value_max) do |j|
      dp[i][j] = dp[i - 1][j] # この商品を使わない場合
      if vv <= j
        w2 = dp[i - 1][j - vv] + ww
        if dp[i][j] > w2
          dp[i][j] = w2
        end
      end
    end
  end

  # 価値の高い方から見ていって、はじめて total_w以下になったときの価値が最大の価値
  vvv = value_max
  while dp[n][vvv] > total_w
    vvv -= 1
  end
  puts vvv

  # weight = 0
  # value = 0
  # choice(dp, v, w, n, total_w).each do |i|
  #   weight += w[i]
  #   value += v[i]
  #   puts "商品#{i} (重さ: #{w[i]}, 価値: #{v[i]})"
  # end
  # puts "トータル 重さ: #{weight}, 価値: #{value}"
end

main
