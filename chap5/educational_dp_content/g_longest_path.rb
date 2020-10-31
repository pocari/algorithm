def read_ints
  gets.chomp.split.map(&:to_i)
end

def traverse(x, ads, dp)
  return dp[x] if dp[x] != -1

  v = 0
  ads[x].each do |y|
    yv = traverse(y, ads, dp) + 1
    if v < yv
      v = yv
    end
  end

  dp[x] = v
end

def longest_path(ads, dp)
  _, x = dp.each_with_index.max_by(&:first)

  routes = [x]
  while not ads[x].empty?
    _, x = ads[x].map {|y| [dp[y], y]}.max_by(&:first)
    routes << x
  end

  routes
end

def main
  n, m = read_ints

  adjustments = Hash.new do |hash, key|
    hash[key] = []
  end
  m.times.map do
    x, y = read_ints
    adjustments[x] << y
  end

  # p [:n, n]
  # p [:m, m]
  # p [:adjustments, adjustments]

  dp = Array.new(n + 1, -1)
  1.upto(n) do |x|
    traverse(x, adjustments, dp)
  end

  # dp[x] に x から進んだときの最長経路数が入っているので、最大値を出す
  puts dp.max

  # pathも知りたい場合
  # p longest_path(adjustments, dp)
end

main