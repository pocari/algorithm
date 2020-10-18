# N個から２個選ぶとO(N**2)にならないんだろうか？？
def solve(ary)
  size = ary.size

  diff = -1
  size.times do |i|
    (i + 1 ... size).each do |j|
      abs = (ary[i] - ary[j]).abs
      if diff < abs
        diff = abs
      end
    end
  end
  diff
end

ary = 0.upto(100).to_a.shuffle.take(10)
diff = solve(ary)
p [:ary, ary]
p [:diff, diff]
