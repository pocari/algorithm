def read_int
  gets.chomp.to_i
end

def read_ints
  gets.chomp.split.map(&:to_i)
end

$nn = nil
$dp = nil

def search(i, j, k)
  t = i + j + k
  return 0 if t == 0
  # puts "------"
  # p [:n, n]
  # p [:i, i]
  # p [:j, j]
  # p [:k, k]
  return $dp[i][j][k] if $dp[i][j][k] != -1

  # 1個でも、2個でも、3個でも、どれでもいいので、寿司が乗っている皿の枚数
  t = t.to_f

  # https://kuroneko1259.hatenablog.com/entry/2019/07/31/124621
  # の説明が一番わかりやすかった。
  #
  # 寿司が1個乗ってる皿の枚数i, 2個乗ってる皿の枚数j, 3個乗ってる皿の枚数kの状態自体を(i, j, k) と表現すると
  # (i, j, k) の寿司を全部食べるまで必要な試行回数の期待値 =
  #   (i, j, k) から1個寿司を食べた後の状態の期待値 ・・・ 1とする
  #   +
  #   (i, j, k) から1個寿司を食べるまでの試行回数の期待値 ・・・2とする
  #
  # 上記1 について
  # - 1個の皿から食べた後の状態
  #   (i - 1, j, k)
  # - 2個の皿から食べた後の状態(2個の皿が一つなくなって、1個の皿が一つ増える
  #   (i + 1, j - 1, k)
  # - 3個の皿から食べた後の状態(3個の皿が一つなくなって、2個の皿が一つ増える
  #   (i, j + 1, k + 1)
  #
  # このそれぞれを(i, j, k)の状態でのそれぞれの出る確率((i or j or k) / ( i + j + k))をかけて期待値を出す
  #
  # 上記2 について
  # ややこしいが
  # 1回で寿司が乗っている皿が選ばれるパターン
  # 2回で寿司が乗っている皿が選ばれるパターン
  # 3回で寿司が乗っている皿が選ばれるパターン
  # ...
  # の期待値の合計を計算する
  # N回で寿司が乗っている更に当たるということはN-1回寿司が乗っていない皿が選ばれた上でN回目に寿司が乗っている皿が選ばれることになる
  # すると、N回で寿司が乗っている皿が選ばれる確率は
  # 寿司が乗っている皿が選ばれる確率を
  #   p = (i + j + k) / N
  # 寿司が乗っていない皿が選ばれる確率を
  #   q = 1 - p
  # とすると
  #
  # An = q ** (n - 1) + p  # n - 1回のqと最後にpが発生する確率
  # その時の期待値 En
  # En = An * N
  # 
  # このEnのn=1〜無限大を合計する
  # この場合、等比数列と等差数列の積の合計値になり
  # https://mathtrain.jp/ar
  # に詳しい。これを自分でも手で計算してみたが、結果的にすごくきれいになって
  #   N / t
  # になる。(t = i + j + k)

  # まず上記2を計算
  #p [:n_t, n, t]
  v = $nn / t
  if i > 0
    # 1個の皿が選ばれる場合
    v += (i / t) * search(i - 1, j, k)
  end

  if j > 0
    # 2個の皿が選ばれる場合
    v += (j / t) * search(i + 1, j - 1, k)
  end

  if k > 0
    # 3個の皿が選ばれる場合
    v += (k / t) * search(i, j + 1, k - 1)
  end

  # p [:dp, i, j, k, v]
  $dp[i][j][k] = v
end

def main
 $nn = read_int

 # 1つだけ,2つだけ、3つだけ寿司が乗ってる皿の数
 one = two = three = 0
 read_ints.each do |count|
   case count
   when 1
     one += 1
   when 2
     two += 1
   else
     three += 1
   end
 end

 # dp[i][j][k] で、1個寿司がある皿の数i, 2個寿司がある皿の数j, 3個寿司がある皿の数kの全部の寿司を食べる回数の期待値
 # 各次元の最大値は全部その個数の皿の数のとき・・・なので、最大皿の数自体(nn)。
 $dp = Array.new($nn + 1) do
   Array.new($nn + 1) do
     Array.new($nn + 1, -1)
   end
 end

 # p [:nn, nn]
 # p [one, two, three]
 search(one, two, three)
 puts $dp[one][two][three]
end

main