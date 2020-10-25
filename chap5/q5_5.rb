def read_int
  gets.chomp.to_i
end

def read_ints
  gets.chomp.split(/ /).map(&:to_i)
end

def main
  w = read_int
  n = read_int
  nums= n.times.map { read_int }

  p [:w, w]
  p [:n, n]
  p [:nums, nums]

  dp = Array.new(n + 1) do
    Array.new(w + 1, -1)
  end

  dp[0][0] = 0

  1.upto(n) do |i|
    0.upto(w) do |j|
      v = nums[i - 1]

      if dp[i - 1][j] >= 0
        # i - 1番目までの数字でjが作れるなら、i番目の数値はつくれる(i番目を使わなければいい)ので1にする
        dp[i][j] = 1
      elsif v > j || dp[i][j - v] <= 0
        # v よりも大きいjは作れないし、 この値を引いた時点での残りのiの個数がなければ(<=0)作れないので-1
        dp[i][j] = -1
      else
        # iを使う場所は全部引き継ぐ
        dp[i][j] = dp[i][j - v]
      end

      # p [i, j, v]
      # puts dp.map {|r|  r.map { _1 == -1 ? '  -' : sprintf("%3d", _1) }.join(" ")}.join("\n")
    end
  end

  puts dp.map {|r|  r.map { _1 == -1 ? '  -' : sprintf("%3d", _1) }.join(" ")}.join("\n")

  if dp[n][w] >= 0
    puts 'yes'
  else
    puts 'no'
  end
end

main
