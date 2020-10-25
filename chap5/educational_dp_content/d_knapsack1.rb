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

  dp = Array.new(n + 1) do
    Array.new(total_w + 1, 0)
  end

  1.upto(n) do |i|
    # 今から試す商品の重さ(ww)と価値(vv)
    ww = w[i - 1]
    vv = v[i - 1]
    1.upto(total_w) do |j|
      dp[i][j] = dp[i - 1][j] # この商品を使わない場合
      if ww <= j
        dp[i][j] = [dp[i][j], dp[i - 1][j - ww] + vv].max # この商品を使う場合と使わないばあいどっちか大きい方
      end
    end
  end

  puts dp[n][total_w]

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
