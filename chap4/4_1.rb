def tribonacchi(n)
  case n
  when 0, 1
    0
  when 2
    1
  else
    tribonacchi(n - 1) + tribonacchi(n - 2) + tribonacchi(n - 3)
  end
end

0.upto(30) do |i|
  p [i, tribonacchi(i)]
end