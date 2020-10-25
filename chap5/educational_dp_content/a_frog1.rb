def read_int
  gets.chomp.to_i
end

def read_ints
  gets.chomp.split(/ /).map(&:to_i)
end

def main
  n = read_int
  h = read_ints

  inf = h.max + 1

  dp = Array.new(n, inf)
  dp[0] = 0

  1.upto(n - 1) do |i|
    dp[i] = dp[i - 1] + (h[i] - h[i - 1]).abs
    dp[i] = [dp[i], dp[i - 2] + (h[i] - h[i - 2]).abs].min if i - 2 >= 0
  end

  puts dp[n - 1]
end

main