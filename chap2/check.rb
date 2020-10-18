puts [
  'N',
  'N * sqrt(N)',
  'sqrt(N)',
  'N * log N',
  'log N',
].join("\t")

1.upto(100) do
  f = _1.to_f
  puts [
    f,
    f * Math.sqrt(f),
    Math.sqrt(f),
    f * Math.log(f, 2),
    Math.log(f, 2),
  ].join("\t")
end