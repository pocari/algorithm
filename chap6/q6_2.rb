# aryのうち、vより大きい要素のうちもっとも小さい値のindex
def lower_bound(ary, v, left, right)
  return nil if left > right

  mid = (left + right) / 2
  if ary[mid] > v
    idx = lower_bound(ary, v, left, mid - 1)
    if idx
      idx
    else
      mid
    end
  else
    lower_bound(ary, v, mid + 1, right)
  end
end

# aryのうち、vより小さい要素のうちもっとも大きい値のindex
def upper_bound(ary, v, left, right)
  return nil if left > right

  mid = (left + right) / 2
  if ary[mid] < v
    idx = upper_bound(ary, v, mid + 1, right)
    if idx
      idx
    else
      mid
    end
  else
    upper_bound(ary, v, left, mid - 1)
  end
end

def main
  nn = gets.chomp.to_i
  as = gets.chomp.split.map(&:to_i).sort
  bs = gets.chomp.split.map(&:to_i).sort
  cs = gets.chomp.split.map(&:to_i).sort

  ans = 0

  # 真ん中のBの行からみて、
  # a側はbの値よりも小さい値のうち最大のindexまで(upper_bound)
  # c側はbの値よりも大きい値のうち最小のindexまで(lower_bound)
  # が対象になるので、そこまでの個数を掛けたものをBの全要素について足し合わせる
  bs.each do |b|
    a_index = upper_bound(as, b, 0, nn - 1)
    c_index = lower_bound(cs, b, 0, nn - 1)
    if a_index && c_index
      ans += (a_index + 1) * (nn - c_index)
    end
  end

  puts ans
end

main

