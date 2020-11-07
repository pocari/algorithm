nn = gets.chomp.to_i
as = gets.chomp.split.map(&:to_i)
$max = as.max

def count_lower(as, l, r, x)
  c = 0
  (l .. r).each do |i|
    if as[i] < x
      c += 1
    end
  end
  c
end

def median(as, left_bound, right_bound)
  half = (right_bound - left_bound + 1) / 2
  l = 0
  r = $max

  while l <= r
    m = (l + r) / 2
    c = count_lower(as, left_bound, right_bound, m)
    # p [:mm, m, c, half, as[left_bound..right_bound]]

    if c > half
      r = m - 1
    else
      l = m + 1
    end
  end
  # p [:lr, l, r]
  r
end

def partial_ranges(n, as)
  0.upto(n - 1).flat_map do |l|
    l.upto(n - 1).map do |r|
      v = median(as, l, r)
      # p [:median, v, as[l..r]]
      v
    end
  end
end

# 0 0
# 0 1
# 0 2
# 1 1
# 1 2
# 2 2
ms = partial_ranges(nn, as)
p median(ms, 0, ms.size - 1)