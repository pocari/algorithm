def tribonacchi(n, cache={})
  return cache[n] if cache[n]

  case n
  when 0, 1
    cache[n] = 0
  when 2
    cache[n] = 1
  else
    cache[n] = tribonacchi(n - 1, cache) + tribonacchi(n - 2, cache) + tribonacchi(n - 3, cache)
  end
end

0.upto(100) do |i|
  p [i, tribonacchi(i)]
end