def read_int
  gets.chomp.to_i
end

def ok?(val, max, used)
  val <= max && used[7] > 0 && used[5] > 0 && used[3] > 0
end

def solve_helper(i, val, nums, max, used)
  # p [:args, val, used]
  if i == nums.size
    # p [:stop, val, used]
    if ok?(val, max, used)
      # p [:ok, val]
      1
    else
      0
    end
  else
    count = 0
    candidate = [3, 5, 7]
    candidate << 0 if val == 0 # まだ0の間は選択しない(=maxがN桁の場合にN未満の桁の数値も試す)
    candidate.each do |n|
      used[n] += 1
      count += solve_helper(i + 1, val * 10 + n, nums, max, used)
      used[n] -= 1
    end
    count
  end
end

def solve(k)
  nums = k.to_s.chars.map(&:to_i)
  solve_helper(0, 0, nums, k, Hash.new(0))
end

puts solve(read_int)
