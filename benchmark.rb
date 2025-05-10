require 'benchmark'
# 辞書に数字、文字列、ハッシュでそれぞれ50000個キー・バリューのペアを挿入するコード
n = 50000

# 格納用の空の辞書
hn = {}
hs = {}
ht = {}

Benchmark.benchmark(" "*7 + Benchmark::CAPTION,
                    7,
                    Benchmark::FORMAT,
                    ">total:",
                    ">avg:") do |x|


  tn = x.report("number:")  { for i in 1..n; hn[i] = i; end }
  ts = x.report("string:")  { for i in 1..n; hs[i.to_s] = i; end }
  tt = x.report("symbol:")  { for i in 1..n; ht[i.to_s.intern] = i; end }

  [tn+ts+tt, (tn+ts+tt)/3]
end