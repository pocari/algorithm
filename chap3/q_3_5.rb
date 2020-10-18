def solve(ary)
  count = 0
  while ary.all?(&:even?)
    ary = ary.map{ _1 / 2 }
    p [:ary, ary]
    count += 1
  end
  count
end

ary = gets.chomp.split(",").map(&:to_i)
p [:initial_ary, ary]
p [:count, solve(ary)]
