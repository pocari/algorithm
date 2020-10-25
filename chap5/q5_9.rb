def read_int
  gets.chomp.to_i
end

def read_ints
  gets.chomp.split(/ /).map(&:to_i)
end

def f(l, r, nums, flag, dp, inf)
  if flag[l][r]
    dp[l][r]
  else
    flag[l][r] = true
    return 0 if l == r
    fans = 999999999999999999
    (l ... r).each do |m|
      fans = [fans, f(l, m, nums, flag, dp, inf) + f(m + 1, r, nums, flag, dp, inf)].min
    end
    dp[l][r] = fans + nums[l..r].sum
  end
end

def main
  n = read_int
  slimes = read_ints

  p [:n, n]
  p [:slimes, slimes]
  flag = Array.new(slimes.size) do
    Array.new(slimes.size, false)
  end

  inf = slimes.max + 1
  dp = Array.new(slimes.size) do
    Array.new(slimes.size, inf)
  end

  f(0, slimes.size - 1, slimes, flag, dp, inf)

  puts dp.map {|r| r.map { _1 == inf ? "  -" : sprintf("%3d", _1) }.join(" ")}.join("\n")
  puts dp[0][slimes.size - 1]
end

main