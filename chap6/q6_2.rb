# ソート済みのaryから、vよりお大きい値が初めて出てくるindexを探す
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

# ソート済みのaryから、v以上の値が初めて出てくるindexを探す
def lower_bound(ary, v, left, right)
  return nil if left > right

  mid = (left + right) / 2
  if ary[mid] >= v
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

def main
  nn = gets.chomp.to_i
  as = gets.chomp.split.map(&:to_i).sort
  bs = gets.chomp.split.map(&:to_i).sort
  cs = gets.chomp.split.map(&:to_i).sort

  # 真ん中のBの行からみて、
  # 1, 2, 3, 4, 5, 6, 7, 8
  # a側はbの値以上の値が初めてでくるindex(lower_bound)未満までの値が使える
  # c側はbの値よりも大きい値が初めて出てくるindex(upper_boun)以上の値を使える
  # が対象になるので、そこまでの個数を掛けたものをBの全要素について足し合わせる
  ans = 0
  bs.each do |b|
    a_index = lower_bound(as, b, 0, nn - 1) || nn # B以上ものがなかったら全部使えるのでnn個になるように調整
    c_index = upper_bound(cs, b, 0, nn - 1) || nn # Bより大きいものがなかったら全部使えないので0になるように調整
    ans += a_index * (nn - c_index)
  end

  puts ans
end

main

