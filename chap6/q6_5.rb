# ソート済みのaryから、vより大きい値が初めて出てくるindexを探す
def upper_bound(ary, v, left, right)
  return nil if left > right

  mid = (left + right) / 2
  if ary[mid] > v
    idx = upper_bound(ary, v, left, mid - 1)
    if idx
      idx
    else
      mid
    end
  else
    upper_bound(ary, v, mid + 1, right)
  end
end

def check_k(as, bs, x, k, nn)
  # p [:x_k, x, k]
  # p [:as, as]
  # p [:bs, bs]

  nn_1 = nn - 1
  cnt = 0
  as.each do |a|
    # p [:cnt_a, cnt, a]
    cnt += (upper_bound(bs, x / a, 0, nn_1) || nn)
  end
  # p [:count, count]

  cnt >= k
end

def read_ints(n)
  ret = Array.new(n)
  gets.chomp.split.each_with_index do |v, i|
    ret[i] = v.to_i
  end
  ret
end

# rubyだとこの問題はtleになるみたいなのでcpp版も作る
nn, kk = gets.chomp.split.map(&:to_i)
as = read_ints(nn)
bs = read_ints(nn)

# p [:nn_kk, nn, kk]
# p [:as, as]
# p [:bs, bs]

l = 0
r = 1000000000000000000
while r - l > 1
  # p [:l_r, l, r]
  x = (l + r) / 2
  if check_k(as, bs, x, kk, nn)
    r = x
  else
    l = x
  end
end

puts r