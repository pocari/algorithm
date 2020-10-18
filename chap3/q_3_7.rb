def read_str
  gets.chomp
end

def solve(s, acc=[], &b)
  if s == ""
    b.call acc.map(&:to_i)
  else
    1.upto(s.size) do |i|
      val = s[0..(i-1)]
      solve(s[i..-1], acc + [val], &b)
    end
  end
end

s = read_str

sum = 0
solve(s) do |expr|
  sum += expr.sum
end
puts sum

