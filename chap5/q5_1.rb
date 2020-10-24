def read_int
  gets.chomp.to_i
end

def read_ints
  gets.chomp.split(' ').map{ _1.to_i }
end

def main
  n = read_int
  points = n.times.map { read_ints }

  # p [:n, n]
  # p [:points, points]

  dp = Array.new(n + 1) do
    Array.new(3, 0)
  end

  1.upto(n) do |i|
    p [:i, i]
    dp[i][0] = [dp[i - 1][1] + points[i - 1][0], dp[i - 1][2] + points[i - 1][0]].max
    dp[i][1] = [dp[i - 1][0] + points[i - 1][1], dp[i - 1][2] + points[i - 1][1]].max
    dp[i][2] = [dp[i - 1][0] + points[i - 1][2], dp[i - 1][1] + points[i - 1][2]].max
  end

  puts dp[n].max
end

main