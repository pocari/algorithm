def read_int
  gets.chomp.to_i
end

def read_ints
  gets.chomp.split(/ /).map(&:to_i)
end

def patterns(dp, n, w, nums, counts, acc = [])
  if n == 0
    p acc
    return
  end

  if dp[n - 1][w] >= 0
    patterns(dp, n - 1, w, nums, counts, acc)
  elsif dp[n][w] >= 0
    v = nums[n - 1]
    rest = dp[n][w]
    patterns(dp, n - 1, w - v, nums, counts, acc + [v] * (counts[n - 1] - rest))
  end
end

def main
  w = read_int
  n = read_int
  nums, counts = n.times.map { read_ints }.transpose

  p [:w, w]
  p [:n, n]
  p [:nums, nums]
  p [:counts, counts]

  dp = Array.new(n + 1) do
    Array.new(w + 1, -1)
  end

  dp[0][0] = 0

  1.upto(n) do |i|
    0.upto(w) do |j|
      v = nums[i - 1]
      c = counts[i - 1]

      if dp[i - 1][j] >= 0
        # i - 1番目までの数字でjが作れるなら、i番目の数値は全部(counts[i-1]) 残せる
        dp[i][j] = c
      elsif v > j || dp[i][j - v] <= 0
        # v よりも大きいjは作れないし、 この値を引いた時点での残りのiの個数がなければ(<=0)作れないので-1
        dp[i][j] = -1
      else
        # この値を引いた時までに残っている個数から1引いてjにする
        dp[i][j] = dp[i][j - v] - 1
      end

      # p [i, j, v]
      # puts dp.map {|r|  r.map { _1 == -1 ? '  -' : sprintf("%3d", _1) }.join(" ")}.join("\n")
    end
  end

  puts dp.map {|r|  r.map { _1 == -1 ? '  -' : sprintf("%3d", _1) }.join(" ")}.join("\n")

  if dp[n][w] >= 0
    puts 'yes'
    patterns(dp, n, w, nums, counts)
  else
    puts 'no'
  end
end

main
