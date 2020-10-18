def read_int
  gets.chomp.to_i
end

def solve(k, n)
  count = 0
  (0 .. k).each do |x|
    (0 .. k).each do |y|
      z = n - (x + y)
      if 0 <= z && z <= k
        count += 1
      end
    end
  end
  count
end

k = read_int
n = read_int

puts solve(k, n)

