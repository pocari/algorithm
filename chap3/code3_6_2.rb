def read_int
  gets.chomp.to_i
end

def solve(n, w ,a, acc = [])
  p [:n, n, :w, w]
  return nil if w < 0

  if n == 0
    if w == 0
      acc
    else
      nil
    end
  else
    # 使うパターン
    ret = solve(n - 1, w - a[n-1], a, acc + [a[n - 1]])
    return ret if ret

    # 使わないパターン
    ret = solve(n - 1, w, a, acc)
    return ret if ret

    return nil
  end
end

def main
  n = read_int
  w = read_int
  a = n.times.map { read_int }

  puts <<~EOS
  dump_inputs
  N: #{n}
  W: #{w}
  array: #{a.join(", ")}
  EOS

  exists = false
  exists = solve(n, w, a)

  if exists
    puts "Yes"
    p [:picked, exists]
  else
    puts "No"
  end
end

main