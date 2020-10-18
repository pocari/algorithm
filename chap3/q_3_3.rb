$max_value = 100
def get_answer(ary)
  min1 = $max_value + 1
  min2 = min1 + 1

  ary.each do |v|
    if min1 < v && v < min2
      min2 = v
    elsif v < min1
      min2 = min1
      min1 = v
    end
  end
  p [:min2, min2]
  min2
end

ary = 2.upto($max_value).to_a.shuffle.take(10).map {_1 + 2}
p ary

p [:expected, ary.sort[1]]
if ary.sort[1] == get_answer(ary)
  puts "OK"
else
  puts "NG"
end