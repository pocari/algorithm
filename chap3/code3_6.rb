def read_int
  gets.chomp.to_i
end

def gen_patterns_helper(values, i, size, acc, &b)
  if i == size
    b.call(acc)
  else
    val = values[i]
    # i番目の要素を含むパターン
    gen_patterns_helper(values, i + 1, size, acc + [values[i]], &b)
    # i番目の要素を含ま無いパターン
    gen_patterns_helper(values, i + 1, size, acc, &b)
  end
end

# vlaues の部分集合を生成
def gen_patterns(values, &b)
  gen_patterns_helper(values, 0, values.size, [], &b)
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
  exists_list = nil
  gen_patterns(a) do |list|
    if w == list.sum
      exists = true
      exists_list = list
    end
  end

  if exists
    puts "Yes"
    puts "picked: #{exists_list}"
  else
    puts "No"
  end
end

main