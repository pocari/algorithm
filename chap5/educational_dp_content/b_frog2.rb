def read_ints
  gets.chomp.split(/ /).map(&:to_i)
end

def main
  n, k = read_ints
  h = read_ints

  # p [:n, n]
  # p [:k, k]
  # p [:h, h]

  inf = 10 ** 10

  dp = Array.new(n, inf)
  dp[0] = 0

  0.upto(n - 1) do |i|
    1.upto(k) do |j|
      if i + j <= n - 1
        dp[i + j] = [dp[i + j], dp[i] + (h[i + j] - h[i]).abs].min
      end
    end
  end

  # p dp
  puts dp[n - 1]
end

main