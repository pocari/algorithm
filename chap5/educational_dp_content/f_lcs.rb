def read_str
  gets.chomp
end

def lcs(dp, s, t)
  i = s.size
  j = t.size
  n = dp[i][j]
  buf = []
  while n > 0
    if s[i - 1] == t[j - 1]
      buf << s[i - 1]
      i -= 1
      j -= 1
      n -= 1
    else
      if dp[i - 1][j] > dp[i][j - 1]
        i -= 1
      else
        j -= 1
      end
    end
  end
  buf.reverse.join
end

s = read_str
t = read_str

# dpテーブル構築時の文字列の添字アクセスがだいぶ遅いので、
# 予め文字列を文字単位で配列(charsまたは数値にしてcodepoints)にして配列の添字アクセスにする(これにしないと必ずtleになる)
s2 = s.chars
t2 = t.chars

dp = Array.new(s.size + 1) do
  Array.new(t.size + 1, -1)
end

# 空文字に対応するlcsのlengthは0
0.upto(s.size) do |i|
  dp[i][0] = 0
end

0.upto(t.size) do |j|
  dp[0][j] = 0
end

# p [:s, s]
# [:t, t]

1.upto(s.size) do |i|
  1.upto(t.size) do |j|
    if s2[i - 1] == t2[j - 1]
      dp[i][j] = dp[i-1][j-1] + 1
    else
      if dp[i - 1][j] < dp[i][j - 1]
        dp[i][j] = dp[i][j - 1]
      else
        dp[i][j] = dp[i - 1][j]
      end
    end
  end
end

puts lcs(dp, s, t)
# puts "    " + (' ' + t).chars.map { sprintf("%2s", _1) }.join(" ")
# puts dp.map.with_index {|row, i| (' ' + s)[i ] + " | " + row.map { sprintf("%2s", _1) }.join(" ")}.join("\n")
