def bin_search(ary, val, left, right)
  return nil if left > right

  mid = (left + right) / 2
  v = ary[mid]
  if val == v
    mid
  elsif val > v
    bin_search(ary, val, mid + 1, right)
  else
    bin_search(ary, val, left, mid - 1)
  end
end

ary = gets.chomp.split.map(&:to_i)
sorted = ary.sort

p ary.map {|v| bin_search(sorted, v, 0, sorted.size - 1) }