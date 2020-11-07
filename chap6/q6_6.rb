def read_ints
  gets.chomp.split.map(&:to_i)
end

$aa, $bb, $cc = read_ints

def expr(t)
  $aa * t + $bb * Math.sin($cc * t * Math::PI)
end

e = 1.0e-11
l = 0.0
r = 2000.0
count = 10000 # l <= r だけだと1問だけTLEになったので、最大でも10000回2分探索したらいけるだろうやってみたらいけた
ok = false
while count > 0
  t = (l + r) / 2
  v = expr(t)
  z = v - 100
  # p [:t_l_r_v, t, l, r, v, e, z]
  if z.abs <= e
    puts t
    ok = true
    break
  end

  if z > e
    r = t
  else
    l = t
  end

  count -= 1
end

unless ok
  puts l
end